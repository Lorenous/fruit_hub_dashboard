import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductCubitState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(AddProductCubitInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;
  void addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    emit(AddProductCubitLoading());
    var result = await imagesRepo.uploadImage(
      image: File(addProductInputEntity.image.path),
      path: BackendEndpoints.images,
    );
    result.fold(
      (f) {
        emit(AddProductCubitFailure(errMessage: f.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(
          addProductInputEntity: addProductInputEntity,
        );
        result.fold(
          (f) {
            emit(AddProductCubitFailure(errMessage: f.message));
          },
          (r) {
            emit(AddProductCubitSuccess());
          },
        );
      },
    );
  }
}
