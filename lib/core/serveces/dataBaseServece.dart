abstract class DataBaseServese {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<dynamic> getData({required String path, String? docId});
}
