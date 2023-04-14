import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefsData;

  /// place in "main.dart" file like: await SharedPrefs.initMySharedPreferences();
  static Future initMySharedPreferences() async {
    prefsData = await SharedPreferences.getInstance();
  }

  /// setter
  static Future<void> setString({required String key, required String value}) async {
    print("Set string key:$key & value: $value");
    await prefsData.setString(key, value);
  }

  static Future<void> setInt({required String key, required int value}) async {
    print("Set string key:$key & value: $value");
    await prefsData.setInt(key, value);
  }

  static Future<void> setBool({required String key, required bool value}) async {
    print("Set bool key:$key & value: $value");
    await prefsData.setBool(key, value);
  }

  /// getter
  static String getString({required String key}) {
    String value = prefsData.getString(key) ?? "";
    print("Get string key: $key & value: $value");
    return value;
  }

  static int getInt({required String key}) {
    int value = prefsData.getInt(key) ?? 0;
    print("Get string key: $key & value: $value");
    return value;
  }

  static bool getBool({required String key}) {
    bool value = prefsData.getBool(key) ?? false;
    print("Get bool key: $key & value: $value");
    return value;
  }

  static Future<void> clearUser() async {
    prefsData.clear();
  }
}

class PrefString {
  static const String email = 'email';
  static const String isIDVerified = 'isIDVerified';
  static const String phoneNo = 'phoneNo';
  static const String isDarkMode = 'isDarkMode';
  static const String token = 'token';
}
