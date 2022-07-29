import 'package:demo_flutter/Screen/Localization/loc_service_getx.dart';
import 'package:get/get.dart';

class LangController extends GetxController {
  List<String> languageList = LocalizationService.langs;
  RxString selectedLanguage = ''.obs;

}
