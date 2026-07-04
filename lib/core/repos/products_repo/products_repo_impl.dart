import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/data.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    try {
      await databaseService.addData(
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
        path: BackendEndpoints.addProductData,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to add product'));
    }
  }
}
