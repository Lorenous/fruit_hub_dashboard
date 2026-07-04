import 'package:fruit_hub_dashboard/core/services/firebase_storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void getitSetup() {
  getIt.registerSingleton<StorageService>(FirebaseStorageService());
}
