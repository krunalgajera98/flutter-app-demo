import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension WidEx on Widget {
  Widget get beResponsive => ResponsiveWrapper.builder(
        this,
        defaultScale: true,
        defaultScaleFactor: 1.05,
        breakpoints: [
          const ResponsiveBreakpoint.resize(800, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      );
}

/// 10
Widget get vertical10 => SizedBox(
      height: 10,
    );

Widget get horizontal10 => SizedBox(
      width: 10,
    );

/// 15

Widget get vertical15 => SizedBox(
      height: 15,
    );

Widget get horizontal15 => SizedBox(
      width: 15,
    );

/// 20

Widget get vertical20 => SizedBox(
      height: 20,
    );

Widget get horizontal20 => SizedBox(
      width: 20,
    );

/// custom
Widget horizontal({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget vertical({required double? height}) {
  return SizedBox(
    height: height,
  );
}
