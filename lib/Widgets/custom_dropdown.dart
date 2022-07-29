import 'package:demo_flutter/Utils/color_res.dart';
import 'package:demo_flutter/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDown extends StatelessWidget {
  final double? height;
  // final double? width;
  final String hint;
  List<String> dropDownList;
  String selectedValue;
  ValueChanged? onChanged;
  final Color? color;

  CustomDropDown({
    this.height,
    // this.width,
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
    required this.dropDownList,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height ?? 6.h,
      // width: width ?? 33.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconDisabledColor: Colors.grey,
            hint: CustomText(
              hint,
              color: AppColor.textColor(context),
              textAlign: TextAlign.center,
              fontSize: 11.sp,
              // color: AppColor.grayTextColor,
            ),
            style: TextStyle(
              fontSize: 12.sp,
            ),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[300],
            ),
            borderRadius: BorderRadius.circular(10),
            items: dropDownList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CustomText(
                  value,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
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

//          child: DropdownButtonHideUnderline(
//             child: DropdownButton(
//               iconDisabledColor: AppColor.grayTextColor,
//               isExpanded: true,
//               hint: AppWidget.customText(text: 'Operator'),
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: AppColor.lightGrayTextColor,
//               ),
//               value: _addAppointmentController.seletedStatus.value == ''
//                   ? null
//                   : _addAppointmentController.seletedStatus.value,
//               items: _addAppointmentController.statusList.map((item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: AppWidget.customText(
//                     text: item,
//                     fontSize: 11.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 );
//               }).toList(),
//               onChanged: (val) {
//                 _addAppointmentController.seletedStatus.value = val.toString();
//               },
//             ),
//           ),
