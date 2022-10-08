import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String labelText;
  final bool isVisibility;
  final VoidCallback suffixIconTap;
  final TextInputType keyboardType;
  final String? hintText;
  final bool enable;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final FocusNode focusNode;
  late RxBool hasFocus;
  final int? maxLength;
  final Color? backGroundColor;

  CustomTextFormField({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
    this.isVisibility = false,
    this.enable = true,
    this.inputFormatters,
    this.maxLength,
    this.hintText,
    this.onTap,
    this.backGroundColor,
    required this.suffixIconTap,
    required this.focusNode,
  }) {
    hasFocus = (focusNode.hasFocus).obs;
    focusNode.addListener(() {
      hasFocus.value = focusNode.hasFocus;
      if (!focusNode.hasFocus) {
        removeDotIfNoValueAfterIt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // decoration: BoxDecoration(
        //   color: backGroundColor ?? AppColor.whiteColor(context),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        child: TextFormField(
          maxLength: maxLength,
          onTap: onTap,
          // textCapitalization: TextCapitalization.characters,
          keyboardType: keyboardType,
          obscureText: isVisibility,
          inputFormatters: inputFormatters,
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          onEditingComplete: () {
            removeDotIfNoValueAfterIt();
            focusNode.unfocus();
          },
          decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.all(3.8.w),
            suffixIcon: obscureText
                ? GestureDetector(
                    onTap: suffixIconTap,
                    child: Icon(
                      isVisibility ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                      size: 5.w,
                    ),
                  )
                : null,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue.withOpacity(0.5),
              ),
            ),
            enabled: enable,
            hintText: hintText,
            fillColor: Colors.blue,
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 10.sp,
              color: hasFocus.value ? Colors.blue : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
            decoration: TextDecoration.none,
          ),
          cursorColor: Colors.blue,
          cursorWidth: 1,
          validator: validator,
        ),
      ),
    );
  }

  void removeDotIfNoValueAfterIt() {
    final String value = controller.text;
    if (keyboardType == TextInputType.number && value.isNotEmpty && value[value.length - 1] == '.') {
      controller.text = value.substring(0, value.length - 1);
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }
}
