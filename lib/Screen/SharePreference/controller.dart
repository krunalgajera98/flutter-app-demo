import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:get/get.dart';

class SharePrefController extends GetxController {
  RxString email = ''.obs;
  RxInt phoneNo = 0.obs;
  RxBool isIDVerified = false.obs;

  void getUser() {
    email.value = SharedPrefs.getString(key: PrefString.email);
    isIDVerified.value = SharedPrefs.getBool(key: PrefString.isIDVerified);
    phoneNo.value = SharedPrefs.getInt(key: PrefString.phoneNo);
  }
}
