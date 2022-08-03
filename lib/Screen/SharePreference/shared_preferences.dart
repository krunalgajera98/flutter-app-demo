import 'package:demo_flutter/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefsData;

  static Future initMySharedPreferences() async {
    prefsData = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser(User user) async {
    print("Save user pref ==> ${user.email} / ${user.isIDVerified} / ${user.phoneNo}");
    await prefsData.setString("email", user.email ?? '');
    await prefsData.setBool("isIDVerified", user.isIDVerified ?? false);
    await prefsData.setInt("phoneNo", user.phoneNo ?? 0);
  }

  static Future<User?> getUser() async {
    String? email = prefsData.getString("email") ?? "";
    bool? isIDVerified = prefsData.getBool("isIDVerified") ?? false;
    int? phoneNo = prefsData.getInt("phoneNo") ?? 0;
    if (email != "" && phoneNo != 0) {
      return User(email: email, phoneNo: phoneNo, isIDVerified: isIDVerified);
    }
    return null;
  }

  static Future<void> clearUser() async {
    prefsData.setString("email", "");
    prefsData.setInt("phoneNo", 0);
    prefsData.setBool("isIDVerified", false);
  }

  /// for saving themeMode
  static Future<void> saveTheme(bool isDarkMode) async {
    print("Save Theme ==> $isDarkMode");
    await prefsData.setBool("isDarkMode", isDarkMode);
  }

  static Future<bool> getTheme() async {
    return prefsData.getBool("isDarkMode") ?? false;
  }
}
