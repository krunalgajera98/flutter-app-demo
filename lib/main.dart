import 'package:demo_flutter/Screen/Animation/ui_with_animation.dart';
import 'package:demo_flutter/Screen/ApiCalling/api_res_screen.dart';
import 'package:demo_flutter/Screen/ImagePickerCrop/image_crop.dart';
import 'package:demo_flutter/Screen/Localization/Localization_screen.dart';
import 'package:demo_flutter/Screen/Localization/loc_service_getx.dart';
import 'package:demo_flutter/Screen/Login/FaceBookLogin/facebook_login_screen.dart';
import 'package:demo_flutter/Screen/Login/Mobile-OTP/mobile_auth_screen.dart';
import 'package:demo_flutter/Screen/Pagination/pagination_screen.dart';
import 'package:demo_flutter/Screen/SQLDataBase/sql_screen.dart';
import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:demo_flutter/Screen/SharePreference/sharepref_screen.dart';
import 'package:demo_flutter/Screen/SppedMeter/speed.dart';
import 'package:demo_flutter/Screen/SppedMeter/speedmeter.dart';
import 'package:demo_flutter/Screen/TextField/text_field_ui.dart';
import 'package:demo_flutter/Screen/Theme/theme_screen.dart';
import 'package:demo_flutter/Utils/color_res.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Screen/HomePage/home_screen.dart';
import 'Screen/Login/GoogleLogin/google_login_screen.dart';
import 'Screen/Theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: 'AIzaSyDz5GrQTHWiY_RudrwD8v7lqHgTyLP458U',
      //   appId: '1:945117182376:android:440264540f90d3bd38859d',
      //   messagingSenderId: '945117182376',
      //   projectId: 'flip-clock-fecc8',
      // ),
      );
  await SharedPrefs.initMySharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        initialBinding: AppBinding(),

        /// theme
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: _themeController.setTheme(),

        /// localization
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        getPages: [
          GetPage(name: HomePage.routeName, page: () => HomePage(), transition: Transition.fadeIn),
          GetPage(name: ApiResScreen.routeName, page: () => ApiResScreen(), transition: Transition.fadeIn),
          GetPage(name: SQLScreen.routeName, page: () => SQLScreen(), transition: Transition.fadeIn),
          GetPage(name: SharePrefScreen.routeName, page: () => SharePrefScreen(), transition: Transition.fadeIn),
          GetPage(name: ThemeScreen.routeName, page: () => ThemeScreen(), transition: Transition.fadeIn),
          GetPage(name: LocalizationScreen.routeName, page: () => LocalizationScreen(), transition: Transition.fadeIn),
          GetPage(name: TextFieldUI.routeName, page: () => TextFieldUI(), transition: Transition.fadeIn),
          GetPage(name: SpeedMeter.routeName, page: () => SpeedMeter(), transition: Transition.fadeIn),
          GetPage(name: SpeedoMeter.routeName, page: () => SpeedoMeter(), transition: Transition.fadeIn),
          GetPage(name: GoogleLoginScreen.routeName, page: () => GoogleLoginScreen(), transition: Transition.fadeIn),
          GetPage(name: PaginationScreen.routeName, page: () => PaginationScreen(), transition: Transition.fadeIn),
          GetPage(
              name: FaceBookLoginScreen.routeName, page: () => FaceBookLoginScreen(), transition: Transition.fadeIn),
          GetPage(name: ImageScanner.routeName, page: () => ImageScanner(), transition: Transition.fadeIn),
          GetPage(name: UIWithAnimation.routeName, page: () => UIWithAnimation(), transition: Transition.fadeIn),
          GetPage(
              name: MobileAuthenticationScreen.routeName,
              page: () => MobileAuthenticationScreen(),
              transition: Transition.fadeIn),
        ],
      );
    });
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeController());
  }
}
