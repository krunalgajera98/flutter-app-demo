import 'package:demo_flutter/Models/user_model.dart';
import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:get/get.dart';

class SharePrefController extends GetxController {
  Rx<User> user = User().obs;

  Future<void> saveUser(User user) async {
    print("Save user pref ==> ${user.email} / ${user.isIDVerified} / ${user.phoneNo}");
    await SharedPrefs.setString(key: PrefString.email, value: user.email ?? '');
    await SharedPrefs.setBool(key: PrefString.isIDVerified, value: user.isIDVerified ?? false);
    await SharedPrefs.setInt(key: PrefString.phoneNo, value: user.phoneNo ?? 0);
  }

  void getUser() {
    String email = SharedPrefs.getString(key: PrefString.email);
    bool isIDVerified = SharedPrefs.getBool(key: PrefString.isIDVerified);
    int phoneNo = SharedPrefs.getInt(key: PrefString.phoneNo);
    //
    user.value = User(email: email, isIDVerified: isIDVerified, phoneNo: phoneNo);
  }
}
