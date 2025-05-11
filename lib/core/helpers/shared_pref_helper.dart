import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  ///Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
    }
  }

  ///Retrieves a [String] with a [key] from the SharedPreferences.
  static getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  ///Retrieves a [bool] with a [key] from the SharedPreferences.
  static getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  ///Retrieves a [int] with a [key] from the SharedPreferences.
  static getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  ///Retrieves a [double] with a [key] from the SharedPreferences.
  static getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  ///Saves a [value] with a [key] in the FlutterSecureStorage.
  static secureData(String key, String value) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.write(key: key, value: value);
  }

  /// Removes a value from FlutterSecureStorage with given [key].
  static Future<void> removeSecuredData(String key) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.delete(key: key);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredData(String key) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: key);
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.deleteAll();
  }
}
