import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage({
    required File image,
    required String path,
  }) async {
    try {
      final imageUrl = await storageService.uploadFile(
        file: image,
        path: BackendEndpoints.images,
      );
      return Right(imageUrl);
    } on FirebaseException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'Unknown Firebase error'),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'Unknown error'));
    }
  }
}
