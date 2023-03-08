import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  final double? height;
  final double? width;
  final String hint;
  List<String> dropDownList;
  String selectedValue;
  ValueChanged? onChanged;

  CustomDropDown({
    this.height,
    this.width,
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
    required this.dropDownList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 55,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconDisabledColor: Colors.grey,
            hint: Text(
              hint,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            style: TextStyle(
              fontSize: 12.sp,
            ),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
            items: dropDownList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            value: selectedValue == '' ? null : selectedValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
