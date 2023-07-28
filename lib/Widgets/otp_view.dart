import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yu360/app/Utils/AppColor/app_color.dart';

class OtpView extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? length;
  final bool obscureText;
  final ValueChanged<String>? onCompleted;
  final bool isDigitalKey;

  const OtpView(
      {Key? key,
      this.focusNode,
      this.controller,
      this.length,
      this.onCompleted,
      this.obscureText = false,
      this.isDigitalKey = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length ?? 6,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      readOnly: false,
      defaultPinTheme: defaultPinTheme(context),
      onCompleted: onCompleted,
      focusedPinTheme: defaultPinTheme(context).copyWith(
        decoration: defaultPinTheme(context).decoration!.copyWith(
              border: Border.all(color: AppColor.grey),
            ),
      ),
      errorPinTheme: defaultPinTheme(context).copyWith(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  PinTheme defaultPinTheme(BuildContext context) {
    return PinTheme(
      width: 60,
      height: 70,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
