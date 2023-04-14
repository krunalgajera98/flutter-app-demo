import 'package:demo_flutter/Screen/Animation/ui_with_animation.dart';
import 'package:demo_flutter/Screen/ApiCalling/api_res_screen.dart';
import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/check_drop_radio_screen.dart';
import 'package:demo_flutter/Screen/FireBase/RemoteMessage/firebase_notification.dart';
import 'package:demo_flutter/Screen/ImagePicker_CallBack/screen.dart';
import 'package:demo_flutter/Screen/Localization/Localization_screen.dart';
import 'package:demo_flutter/Screen/Login/FaceBookLogin/facebook_login_screen.dart';
import 'package:demo_flutter/Screen/Login/GoogleLogin/google_login_screen.dart';
import 'package:demo_flutter/Screen/Login/Mobile-OTP/mobile_auth_screen.dart';
import 'package:demo_flutter/Screen/Pagination/pagination_screen.dart';
import 'package:demo_flutter/Screen/SQLDataBase/sql_screen.dart';
import 'package:demo_flutter/Screen/SharePreference/sharepref_screen.dart';
import 'package:demo_flutter/Screen/Text%20&%20TextField/text_field_ui.dart';
import 'package:demo_flutter/Screen/Theme/theme_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FireBaseNotification().localNotificationRequestPermissions();
    FireBaseNotification().configureDidReceiveLocalNotificationSubject();
    FireBaseNotification().configureSelectNotificationSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('𝙆𝙍𝙐𝙉𝘼𝙇'), centerTitle: true, toolbarHeight: 22),
        body: Center(
          child: SingleChildScrollView(
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
                    Get.toNamed(PaginationScreen.routeName);
                  },
                  child: Text('Pagination'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(GoogleLoginScreen.routeName);
                  },
                  child: Text('GoogleLogin'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(FaceBookLoginScreen.routeName);
                  },
                  child: Text('FaceBookLogin'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MobileAuthenticationScreen.routeName);
                  },
                  child: Text('Login With Mobile no./ Otp'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(UIWithAnimation.routeName);
                  },
                  child: Text('UIWithAnimation'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ImagePickerCallBackScreen.routeName);
                  },
                  child: Text('ImagePicker(camera & file) or CallBack'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(OptionWidgets.routeName);
                  },
                  child: Text('CheckBox - DropDown - Nested RadioButton'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
