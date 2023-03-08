import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/Widgets/app_checkbox.dart';
import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/Widgets/app_drop_down.dart';
import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/Widgets/app_radio_button.dart';
import 'package:demo_flutter/Screen/CheckBox_DropDown_RadioButton/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OptionWidgets extends StatelessWidget {
  static const routeName = '/OptionWidgets';
  final OptionController _controller = Get.put(OptionController());

  OptionWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CustomDropDown(
                hint: "Select Country",
                selectedValue: _controller.selectedCountry.value,
                dropDownList: ['Swiss Franc', 'Indian'],
                onChanged: (val) {
                  _controller.selectedCountry.value = val;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(
              () => AppCheckBox(
                checkValue: _controller.isCheck.value,
                onChanged: (bool? val) {
                  _controller.isCheck.value = val!;
                },
                text: 'Terms & Condition',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(
              () => AppRadioButton(
                title: 'Type',
                list: ['High', 'Medium', 'Low'],
                selectedItem: _controller.selectedType.value,
                onChanged: (String? value) {
                  _controller.selectedType.value = value!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
