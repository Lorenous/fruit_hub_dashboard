import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class FirebaseStorageService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile({required File file, required String path}) async {
    var fileName = p.basename(file.path);
    var fileExtension = p.extension(file.path);
    var fileRef = storageRef.child("$path/$fileName.$fileExtension");
    await fileRef.putFile(file);
    var fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
