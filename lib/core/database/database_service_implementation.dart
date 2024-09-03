import 'package:i_travel/core/database/database_service.dart';
import 'package:i_travel/core/database/database_strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServiceImplementation extends DatabaseService {
  DatabaseServiceImplementation() {
    getDatabase();
  }

  static Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await createDatabase();
      return _database!;
    }
  }

  Future<Database> createDatabase() async {
    final String generateDatabasePath = await getDatabasesPath();
    final databasePath =
        join(generateDatabasePath, DatabaseStrings.databaseName);
    final Database database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE ${DatabaseStrings.planTableName} (
        ${DatabaseStrings.planIdColumnName} TEXT PRIMARY KEY,
         ${DatabaseStrings.planNameColumnName} TEXT NOT NULL, 
         ${DatabaseStrings.planAddressColumnName} TEXT NOT NULL, 
         ${DatabaseStrings.planDateColumnName} TEXT NOT NULL, 
         ${DatabaseStrings.planImageColumnName} TEXT NOT NULL, 
         ${DatabaseStrings.planPriceColumnName} REAL NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  @override
  Future<void> insertRowInToDatabase({
    required String tableName,
    required Map<String, dynamic> values,
  }) async {
    await _database!.insert(tableName, values);
  }

  @override
  Future<List<Map<String, dynamic>>> getTableFromDatabase({
    required String tableName,
  }) async {
    return await _database!.query(tableName);
  }

  @override
  Future<void> deleteRowFromDatabase({
    required String tableName,
    required String id,
  }) async {
    await _database!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }
}
