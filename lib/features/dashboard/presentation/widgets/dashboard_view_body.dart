import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: CustomButton(
          text: 'Add Data',
          onPressed: () {
            Navigator.of(context).pushNamed(AddProductView.routeName);
          },
        ),
      ),
    );
  }
}
