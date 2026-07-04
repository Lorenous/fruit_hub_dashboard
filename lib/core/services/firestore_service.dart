import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId == null) {
      await FirebaseFirestore.instance.collection(path).add(data);
    } else {
      FirebaseFirestore.instance.collection(path).doc(docId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection(path)
        .doc(docId)
        .get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExt({required String path, required String docId}) async {
    var data = await FirebaseFirestore.instance
        .collection(path)
        .doc(docId)
        .get();
    return data.exists;
  }
}
