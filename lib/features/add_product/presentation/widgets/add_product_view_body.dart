import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/image_picker_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/is_featured.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/product_form_fields.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? image;
  bool isFeatured = false;

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
            ImagePickerField(
              onImageSelected: (value) {
                image = value;
              },
            ),
            const SizedBox(height: 20),
            IsFeatured(
              value: isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value!;
                });
              },
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: 'Add Product',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select an image')),
                    );
                  } else {
                    AddProductInputEntity input = AddProductInputEntity(
                      name: _nameController.text,
                      code: _codeController.text,
                      description: _descriptionController.text,
                      price: _priceController.text,
                      image: image!,
                      isFeatured: isFeatured,
                    );
                    context.read<AddProductCubit>().addProduct(
                      addProductInputEntity: input,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
