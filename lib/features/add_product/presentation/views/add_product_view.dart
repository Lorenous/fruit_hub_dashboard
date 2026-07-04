import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, text: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          imagesRepo: getIt.get<ImagesRepo>(),
          productsRepo: getIt.get<ProductsRepo>(),
        ),
        child: const AddProductViewBody(),
      ),
    );
  }
}
