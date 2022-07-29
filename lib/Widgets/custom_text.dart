import 'package:demo_flutter/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  Color? color;
  int? maxLines;
  FontWeight? fontWeight;
  double? letterSpacing;
  TextAlign? textAlign;

  CustomText(
    this.text, {
    this.fontSize,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        color: color ?? AppColor.textColor(context),
        fontWeight: fontWeight ?? FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        // fontFamily: 'Sarabun',
        letterSpacing: letterSpacing ?? 0,
      ),
    );
  }
}
