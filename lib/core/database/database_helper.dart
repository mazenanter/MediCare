import 'package:medicare/core/helpers/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'medicare.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${AppConstants.tableName} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            type TEXT,
            dose TEXT,
            amount INTEGER,
            dateTime INTEGER,
            createdAt INTEGER,
            repeatType TEXT,
            intervalHours INTEGER,
            durationDays INTEGER,
            isTaken INTEGER DEFAULT 0,
            isSynced INTEGER DEFAULT 0
           )
        ''');
      },
    );
  }

  static Future<void> deleteDatabaseFile() async {
    final path = join(await getDatabasesPath(), 'medicare.db');
    await deleteDatabase(path);
  }
}
