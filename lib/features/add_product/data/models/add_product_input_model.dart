import 'package:image_picker/image_picker.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final String price;
  final XFile? image;

  const AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'description': description,
        'price': price,
        'imagePath': image?.path,
      };
}