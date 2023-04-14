import 'package:demo_flutter/Utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? fontSize;
  final double? hintTextFontSize;
  final int? maxLength;
  final double? radius;
  final double? latterSpacing;
  final bool enabled;
  final bool isGradiant;
  final bool obscureText;
  final bool isAutoFocus;
  final FocusNode? focusNode;
  final String? hintText;
  final Color? hintColor;
  final FontWeight? hintTextWeight;
  final FontWeight? textWeight;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;
  final Color? enabledBorderColor;
  final Color? disabledBorder;
  final Color? focusedColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? height;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  CustomTextField(
      {Key? key,
      this.onChanged,
      this.maxLine = 1,
      this.maxLength,
      this.radius = 32,
      this.latterSpacing,
      this.fontSize,
      this.hintTextFontSize,
      this.fillColor,
      this.textColor,
      this.obscureText = false,
      this.isAutoFocus = false,
      this.enabled = true,
      this.isGradiant = true,
      this.keyboardType = TextInputType.text,
      this.focusNode,
      this.hintText,
      this.hintColor,
      this.hintTextWeight,
      this.textWeight = FontWeight.w400,
      this.textAlign,
      this.textAlignVertical,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.enabledBorderColor,
      this.disabledBorder,
      this.focusedColor,
      this.cursorColor,
      required this.controller,
      this.contentPadding,
      this.prefixWidget,
      this.suffixWidget,
      this.readOnly = false,
      this.height,
      this.width,
      this.inputFormatters,
      this.validator})
      : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscure,
      builder: (context, bool isObscure, _) {
        if (!obscureText) {
          isObscure = false;
        }
        return SizedBox(
          height: height != null
              ? height! > 20
                  ? height
                  : 20
              : null,
          width: width,
          child: TextFormField(
            validator: validator,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 14,
              fontWeight: textWeight,
              letterSpacing: latterSpacing,
            ),
            cursorColor: cursorColor ?? Colors.white,
            onTap: onTap,
            obscureText: isObscure,
            obscuringCharacter: '*',
            autofocus: isAutoFocus,
            onChanged: onChanged,
            controller: controller,
            maxLines: maxLine,
            maxLength: maxLength,
            keyboardType: keyboardType,
            focusNode: focusNode,
            textAlignVertical: textAlignVertical,
            textAlign: textAlign ?? TextAlign.start,
            enabled: enabled,
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red),
              isDense: true,
              prefixIcon: prefixIcon,
              prefix: prefixWidget,
              suffix: suffixWidget,
              filled: true,
              fillColor: fillColor ?? Colors.transparent,
              counterText: "",
              hintText: hintText,
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              suffixIcon: suffixIcon == null && obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _isObscure.value = !isObscure;
                      },
                    )
                  : suffixIcon,
              hintStyle: TextStyle(
                color: hintColor ?? Colors.white,
                fontSize: hintTextFontSize ?? 14,
                fontWeight: textWeight,
                letterSpacing: latterSpacing,
              ),
              focusedErrorBorder: isGradiant
                  ? GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft, end: Alignment.centerRight, colors: AppColor.gradiantColor),
                      width: 2,
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: disabledBorder ?? Colors.blue),
                    ),
              focusedBorder: isGradiant
                  ? GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft, end: Alignment.centerRight, colors: AppColor.gradiantColor),
                      width: 2,
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: disabledBorder ?? Colors.blue),
                    ),
              errorBorder: isGradiant
                  ? GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft, end: Alignment.centerRight, colors: AppColor.gradiantColor),
                      width: 2,
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: disabledBorder ?? Colors.blue),
                    ),
              disabledBorder: isGradiant
                  ? GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft, end: Alignment.centerRight, colors: AppColor.gradiantColor),
                      width: 2,
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: disabledBorder ?? Colors.blue),
                    ),
              enabledBorder: isGradiant
                  ? GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft, end: Alignment.centerRight, colors: AppColor.gradiantColor),
                      width: 2,
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                      borderSide: BorderSide(color: enabledBorderColor ?? Colors.blue),
                    ),
            ),
          ),
        );
      },
    );
  }
}
