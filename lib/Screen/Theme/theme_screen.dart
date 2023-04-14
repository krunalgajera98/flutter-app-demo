import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:demo_flutter/Screen/Theme/theme_controller.dart';
import 'package:demo_flutter/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        _themeController.switchValDark.value == true ? ThemeMode.dark : ThemeMode.light);
                    await SharedPrefs.setBool(key: PrefString.isDarkMode,value :_themeController.switchValDark.value);
                  },
                  activeColor: CupertinoColors.activeGreen,
                ),
              ),

              /// UI
              SizedBox(
                height: 100,
              ),
              Container(
                width: 150,
                height: 150,
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
                height:20,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.back2Color(context),
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
            ],
          ),
        ),
      ),
    );
  }
}
