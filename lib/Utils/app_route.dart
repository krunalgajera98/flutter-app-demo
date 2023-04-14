import 'package:demo_flutter/Screen/ApiCalling/api_res_screen.dart';
import 'package:demo_flutter/Screen/HomePage/home_screen.dart';
import 'package:demo_flutter/Screen/Login/GoogleLogin/google_login_screen.dart';
import 'package:demo_flutter/Screen/SQLDataBase/sql_screen.dart';
import 'package:demo_flutter/Screen/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/Screen/Animation/ui_with_animation.dart';
import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/check_drop_radio_screen.dart';
import 'package:demo_flutter/Screen/ImagePicker_CallBack/screen.dart';
import 'package:demo_flutter/Screen/Localization/Localization_screen.dart';
import 'package:demo_flutter/Screen/Login/FaceBookLogin/facebook_login_screen.dart';
import 'package:demo_flutter/Screen/Login/Mobile-OTP/mobile_auth_screen.dart';
import 'package:demo_flutter/Screen/Pagination/pagination_screen.dart';
import 'package:demo_flutter/Screen/SharePreference/sharepref_screen.dart';
import 'package:demo_flutter/Screen/Text%20&%20TextField/text_field_ui.dart';
import 'package:demo_flutter/Screen/Theme/theme_screen.dart';

List<GetPage<dynamic>>? getPages  = [
  GetPage(name: SplashScreen.routeName, page: () => SplashScreen(), transition: Transition.fadeIn),
  GetPage(name: HomePage.routeName, page: () => HomePage(), transition: Transition.fadeIn),
  GetPage(name: ApiResScreen.routeName, page: () => ApiResScreen(), transition: Transition.fadeIn),
  GetPage(name: SQLScreen.routeName, page: () => SQLScreen(), transition: Transition.fadeIn),
  GetPage(name: SharePrefScreen.routeName, page: () => SharePrefScreen(), transition: Transition.fadeIn),
  GetPage(name: ThemeScreen.routeName, page: () => ThemeScreen(), transition: Transition.fadeIn),
  GetPage(name: LocalizationScreen.routeName, page: () => LocalizationScreen(), transition: Transition.fadeIn),
  GetPage(name: TextFieldUI.routeName, page: () => TextFieldUI(), transition: Transition.fadeIn),
  GetPage(name: GoogleLoginScreen.routeName, page: () => GoogleLoginScreen(), transition: Transition.fadeIn),
  GetPage(name: PaginationScreen.routeName, page: () => PaginationScreen(), transition: Transition.fadeIn),
  GetPage(name: OptionWidgets.routeName, page: () => OptionWidgets(), transition: Transition.fadeIn),
  GetPage(name: FaceBookLoginScreen.routeName, page: () => FaceBookLoginScreen(), transition: Transition.fadeIn),
  GetPage(name: UIWithAnimation.routeName, page: () => UIWithAnimation(), transition: Transition.fadeIn),
  GetPage(
      name: ImagePickerCallBackScreen.routeName,
      page: () => ImagePickerCallBackScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: MobileAuthenticationScreen.routeName,
      page: () => MobileAuthenticationScreen(),
      transition: Transition.fadeIn),
];
