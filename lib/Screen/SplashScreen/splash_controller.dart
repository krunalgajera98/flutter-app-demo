import 'dart:async';

import 'package:demo_flutter/Screen/HomePage/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getRoutes();
    super.onInit();
  }

  void getRoutes() {
    Future.delayed(Duration(seconds: 3), () => Get.offAndToNamed(HomePage.routeName));
  }
}
