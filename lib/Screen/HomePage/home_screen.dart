import 'package:demo_flutter/Screen/ApiCalling/api_res_screen.dart';
import 'package:demo_flutter/Screen/FaceBookLogin/facebook_login_screen.dart';
import 'package:demo_flutter/Screen/GoogleLogin/google_login_screen.dart';
import 'package:demo_flutter/Screen/Localization/Localization_screen.dart';
import 'package:demo_flutter/Screen/SQLDataBase/sql_screen.dart';
import 'package:demo_flutter/Screen/SharePreference/sharepref_screen.dart';
import 'package:demo_flutter/Screen/SppedMeter/speed.dart';
import 'package:demo_flutter/Screen/SppedMeter/speedmeter.dart';
import 'package:demo_flutter/Screen/TextField/text_field_ui.dart';
import 'package:demo_flutter/Screen/Theme/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 20),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(ApiResScreen.routeName);
                },
                child: Text('Api Calling'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(SQLScreen.routeName);
                },
                child: Text('SQL Database'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(SharePrefScreen.routeName);
                },
                child: Text('SharePreference'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(ThemeScreen.routeName);
                },
                child: Text('Theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(LocalizationScreen.routeName);
                },
                child: Text('Localization'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(TextFieldUI.routeName);
                },
                child: Text('TextField'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(SpeedMeter.routeName);
                },
                child: Text('SpeedMeter'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(SpeedoMeter.routeName);
                },
                child: Text('SpeedoMeter'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(GoogleLoginScreen.routeName);
                },
                child: Text('GoogleLoginScreen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(FaceBookLoginScreen.routeName);
                },
                child: Text('FaceBookLoginScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
