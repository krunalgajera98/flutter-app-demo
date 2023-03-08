import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool enable;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final FocusNode focusNode;
  final int? maxLength;
  final Color? backGroundColor;
  late RxBool hasFocus;

  CustomTextFormField({
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.labelText,
    this.enable = true,
    this.inputFormatters,
    this.maxLength,
    this.hintText,
    this.onTap,
    this.backGroundColor,
    required this.focusNode,
  }) {
    hasFocus = (focusNode.hasFocus).obs;
    focusNode.addListener(() {
      hasFocus.value = focusNode.hasFocus;
    });
  }

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscure,
      builder: (context, bool isObscure, _) {
        if (!obscureText) {
          isObscure = false;
        }
        return Obx(
          () => Container(
            decoration: BoxDecoration(
              color: backGroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLength: maxLength,
              onTap: onTap,
              keyboardType: keyboardType,
              obscureText: isObscure,
              inputFormatters: inputFormatters,
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                focusNode.unfocus();
              },
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.all(3.8.w),
                suffixIcon: obscureText
                    ? IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _isObscure.value = !isObscure;
                        },
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
      },
    );
  }
}
