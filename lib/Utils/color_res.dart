import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static Color backgroundColor(BuildContext context) => context.theme.backgroundColor;

  static Color whiteColor(BuildContext context) => context.theme.primaryColor;

  static Color redTextColor(BuildContext context) => context.theme.shadowColor;

  static Color blueTextColor(BuildContext context) => context.theme.secondaryHeaderColor;

  static Color forGradiantAppBar(BuildContext context) => context.theme.unselectedWidgetColor;

  static Color textColor(BuildContext context) => context.theme.bottomAppBarColor;
}

class Themes {
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: ColorCollection.backgroundColorDark,
    primaryColor: ColorCollection.whiteColorDark,
    shadowColor: ColorCollection.redTextColorDark,
    secondaryHeaderColor: ColorCollection.blueTextColorDark,
    unselectedWidgetColor: ColorCollection.gradiantAppBarDark,
    bottomAppBarColor: ColorCollection.textColorDark,
  );
  static final light = ThemeData.light().copyWith(
    backgroundColor: ColorCollection.backgroundColorLight,
    shadowColor: ColorCollection.redTextColorLight,
    secondaryHeaderColor: ColorCollection.blueTextColorLight,
    unselectedWidgetColor: ColorCollection.gradiantAppBarLight,
    bottomAppBarColor: ColorCollection.textColorLight,
  );
}

class ColorCollection {
  ///dark theme color
  static const Color backgroundColorDark = Color(0xFF0F0E0F);
  static const Color redTextColorDark = Color(0xFFFF3333);
  static const Color blueTextColorDark = Color(0xFF33AEFF);
  static const Color whiteColorDark = Color(0xFFFFFFFF);
  static const Color gradiantAppBarDark = Color(0xFF241F1C);
  static const Color textColorDark = Colors.white;

  ///light theme color
  static const Color backgroundColorLight = Color(0xFFF2F2F2);
  static const Color redTextColorLight = Color(0xFF511212);
  static const Color blueTextColorLight = Color(0xFF08466D);
  static const Color whiteColorLight = Color(0xFF241F1C);
  static const Color gradiantAppBarLight = Color(0xFF0E0026);
  static const Color textColorLight = Colors.black;
}
