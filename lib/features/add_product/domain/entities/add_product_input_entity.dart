import 'package:image_picker/image_picker.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final String price;
  final XFile? image;

  const AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.image,
  });
}
