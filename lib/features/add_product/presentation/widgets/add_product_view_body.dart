import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/image_picker_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/product_form_fields.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add New Product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ProductFormFields(
              nameController: _nameController,
              descriptionController: _descriptionController,
              priceController: _priceController,
              codeController: _codeController,
            ),
            const SizedBox(height: 20),
            const ImagePickerField(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Add Product',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement add product logic
                  Navigator.of(context).pop(); // Go back to dashboard
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
