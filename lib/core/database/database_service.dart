abstract class DatabaseService{

  Future<void> insertRowInToDatabase({
    required String tableName,
    required Map<String, dynamic> values,
  });
  Future<List<Map<String,dynamic>>> getTableFromDatabase({
    required String tableName,
  });
}