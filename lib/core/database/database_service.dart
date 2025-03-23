import 'package:medicare/core/database/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Future<Database?> get database async => await DatabaseHelper.database;

  static Future<int> insert(String table, dynamic data) async {
    final db = await database;
    return db!.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    final db = await database;
    return db!.query(table);
  }

  static Future<int> update(
      String table, Map<String, dynamic> data, String id) async {
    final db = await database;
    return await db!.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> delete(String table, int id) async {
    final db = await database;
    return db!.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
