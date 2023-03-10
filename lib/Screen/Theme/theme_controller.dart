import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool switchValDark = false.obs;

  @override
  void onInit() {
    getTheme();
    super.onInit();
  }

  ThemeMode setTheme() {
    return switchValDark.value ? ThemeMode.dark : ThemeMode.light;
  }

  getTheme() {
    switchValDark.value = SharedPrefs.getBool(key: PrefString.isDarkMode);
  }
}
