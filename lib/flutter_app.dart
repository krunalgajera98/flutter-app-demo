import 'package:demo_flutter/Screen/Localization/loc_service_getx.dart';
import 'package:demo_flutter/Screen/SplashScreen/splash_screen.dart';
import 'package:demo_flutter/Utils/app_route.dart';
import 'package:demo_flutter/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Screen/Theme/theme_controller.dart';

class MyApp extends StatelessWidget {
  ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          // currentFocus.focusedChild?.unfocus();
          // FocusManager.instance.primaryFocus?.unfocus();
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        initialBinding: AppBinding(),

        /// theme
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: _themeController.setTheme(),

        /// localization
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),

        ///
        getPages: getPages,

        ///  for responsive ui
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          );
        },
      ),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeController());
  }
}
