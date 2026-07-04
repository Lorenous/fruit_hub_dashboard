import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo.dart'
    show ProductsRepo;
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/services/firebase_storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void getitSetup() {
  getIt.registerSingleton<StorageService>(FirebaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getIt<StorageService>()),
  );
}
