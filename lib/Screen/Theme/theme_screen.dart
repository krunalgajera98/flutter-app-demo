import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:demo_flutter/Screen/Theme/theme_controller.dart';
import 'package:demo_flutter/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/ThemeScreen';
  ThemeScreen({Key? key}) : super(key: key);
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Switch
              Obx(
                () => CupertinoSwitch(
                  value: _themeController.switchValDark.value,
                  onChanged: (value) async {
                    _themeController.switchValDark.value = value;
                    Get.changeThemeMode(
                        _themeController.switchValDark.value == true
                            ? ThemeMode.dark
                            : ThemeMode.light);
                    await SharedPrefs.saveTheme(
                        _themeController.switchValDark.value);
                  },
                  activeColor: CupertinoColors.activeOrange,
                ),
              ),
              Obx(
                () => FlutterSwitch(
                  width: 100.0,
                  height: 55.0,
                  toggleSize: 45.0,
                  value: _themeController.switchValDark.value,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeToggleColor: Color(0xFF0082C8),
                  inactiveToggleColor: Color(0xFF01579B),
                  activeSwitchBorder: Border.all(
                    color: Color(0xFF00D2B8),
                    width: 6.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Color(0xFF29B6F6),
                    width: 6.0,
                  ),
                  activeColor: Color(0xFF55DDCA),
                  inactiveColor: Color(0xFF54C5F8),
                  activeIcon: Image.network(
                    "https://img2.pngio.com/functional-bits-in-flutter-flutter-community-medium-flutter-png-1000_1000.png",
                  ),
                  inactiveIcon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
                  ),
                  onToggle: (val) async {
                    _themeController.switchValDark.value = val;
                    Get.changeThemeMode(
                        _themeController.switchValDark.value == true
                            ? ThemeMode.dark
                            : ThemeMode.light);
                    await SharedPrefs.saveTheme(
                        _themeController.switchValDark.value);
                  },
                ),
              ),
              /// UI
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 30.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.backgroundColor(context),
                ),
                child: Center(
                  child: Text(
                    _themeController.switchValDark.value ? 'Dark' : 'Light',
                    style: TextStyle(
                      color: AppColor.textColor(context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 30.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.redTextColor(context),
                ),
                child: Center(
                  child: Text(
                    _themeController.switchValDark.value ? 'Dark' : 'Light',
                    style: TextStyle(
                      color: AppColor.blueTextColor(context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 30.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.forGradiantAppBar(context),
                ),
                child: Center(
                  child: Text(
                    _themeController.switchValDark.value ? 'Dark' : 'Light',
                    style: TextStyle(
                      color: AppColor.redTextColor(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
