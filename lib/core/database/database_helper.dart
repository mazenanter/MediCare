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
          CREATE TABLE medication (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            dose TEXT,
            amount INTEGER,
            dateTime TEXT,
            isTaken BOOLEAN
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
