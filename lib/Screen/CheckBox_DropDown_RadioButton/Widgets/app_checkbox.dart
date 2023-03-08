import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppCheckBox extends StatelessWidget {
  bool checkValue;
  String text;
  void Function(bool?)? onChanged;

  AppCheckBox({required this.checkValue, this.text = '', this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkValue = !checkValue;
        onChanged?.call(checkValue);
      },
      child: Row(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: checkValue,
              onChanged: (bool? val) {
                onChanged?.call(val);
              },
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
