// import 'package:easy_localization/easy_localization.dart' ;
import 'package:demo_flutter/Screen/Localization/lang_controller.dart';
import 'package:demo_flutter/Screen/Localization/loc_service_getx.dart';
import 'package:demo_flutter/Utils/color_res.dart';
import 'package:demo_flutter/Widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationScreen extends StatelessWidget {
  static const routeName = '/LocalizationScreen';
  LangController _langController = Get.put(LangController());

  LocalizationScreen({Key? key}) : super(key: key);
  RxBool loader = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Obx(
          () {
            print(loader.value);
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hello'.tr,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ElevatedButton(
                  onPressed: () {
                    LocalizationService().changeLocale('English');
                  },
                  child: Text('english with getx'),
                ),
                ElevatedButton(
                  onPressed: () {
                    LocalizationService().changeLocale('Hindi');
                  },
                  child: Text('Hindi with getx'),
                ),
                CustomDropDown(
                  color: AppColor.backgroundColor(context),
                  hint: "Select Language",
                  selectedValue: _langController.selectedLanguage.value,
                  dropDownList: _langController.languageList,
                  onChanged: (val) {
                    _langController.selectedLanguage.value = val;
                    LocalizationService().changeLocale(_langController.selectedLanguage.value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
