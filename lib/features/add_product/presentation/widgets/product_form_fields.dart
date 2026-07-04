import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';

class ProductFormFields extends StatelessWidget {
  const ProductFormFields({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.codeController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Product Name',
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a product name';
            }
            return null;
          },
          onSaved: (newValue) {
            nameController.text = newValue!;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'Price',
          controller: priceController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            final price = double.tryParse(value);
            if (price == null || price <= 0) {
              return 'Please enter a valid price';
            }
            return null;
          },
          onSaved: (newValue) {
            priceController.text = newValue!;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'Product Code',
          controller: codeController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a product code';
            }
            return null;
          },
          onSaved: (newValue) {
            codeController.text = newValue!;
          },
        ),

        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'Description',
          controller: descriptionController,
          maxLines: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
          onSaved: (newValue) {
            descriptionController.text = newValue!;
          },
        ),
      ],
    );
  }
}
