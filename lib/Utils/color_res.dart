import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static Color backgroundColor(BuildContext context) => context.theme.backgroundColor;

  static Color back2Color(BuildContext context) => context.theme.shadowColor;

  static Color textColor(BuildContext context) => context.theme.bottomAppBarColor;

  static const List<Color> gradiantColor = [
    Color(0XFF405DE6),
    Color(0XFF5881DB),
    Color(0XFF833AB4),
    Color(0XFFC13584),
    Color(0XFFE1306c),
    Color(0XFFFD1D1D),
  ];
}

class Themes {
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: ColorCollection.backgroundColorDark,
    shadowColor: ColorCollection.backColor2Dark,
    bottomAppBarColor: ColorCollection.textColorDark,
  );
  static final light = ThemeData.light().copyWith(
    backgroundColor: ColorCollection.backgroundColorLight,
    shadowColor: ColorCollection.backColor2Light,
    bottomAppBarColor: ColorCollection.textColorLight,
  );
}

class ColorCollection {
  ///dark theme color
  static const Color backgroundColorDark = Color(0xFFF2F2F2);
  static const Color textColorDark = Colors.black;
  static const Color backColor2Dark = Colors.amber;

  ///light theme color
  static const Color backgroundColorLight = Color(0xFF0F0E0F);
  static const Color textColorLight = Colors.white;
  static const Color backColor2Light = Colors.teal;
}
