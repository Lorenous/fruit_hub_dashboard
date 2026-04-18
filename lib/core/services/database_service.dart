abstract class DatabaseService {
  Future<void> addData({
    required String path,
    String? docId,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  });

  Future<bool> isDataExt({required String path, required String docId});
}
