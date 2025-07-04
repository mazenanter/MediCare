import 'package:medicare/core/database/database_helper.dart';
import 'package:medicare/core/helpers/constants.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Future<Database?> get database async => await DatabaseHelper.database;

  static Future<int> insert(String table, dynamic data) async {
    final db = await database;
    return db!.insert(table, data);
  }

  static Future<void> updateMedicationSyncStatus(String id) async {
    final db = await database;
    await db!.update(
      'medication',
      {'isSynced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getUnsyncedMedications() async {
    final db = await database;
    return await db!.query('medication', where: 'isSynced = 0');
  }

  static Future<List<Map<String, dynamic>>> getAllMedications(
      String table) async {
    final db = await database;
    return db!.query(table);
  }

  static Future<int> update(
      String table, Map<String, dynamic> data, String id) async {
    final db = await database;
    return await db!.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> delete(String table, String id) async {
    final db = await database;
    return db!.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getPendingOperations() async {
    final db = await database;
    return db!.query(AppConstants.pendingOperationsTaple);
  }

  static Future deletePendingOperation(int id) async {
    final db = await database;
    await db!.delete(
      AppConstants.pendingOperationsTaple,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future getMedicationById(String id) async {
    final db = await database;
    return await db!.query(
      AppConstants.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
