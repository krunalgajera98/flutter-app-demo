import 'package:demo_flutter/Screen/Localization/lang_map/en_us.dart';
import 'package:demo_flutter/Screen/Localization/lang_map/hi_in.dart';
import 'package:demo_flutter/Screen/Localization/lang_map/ja_jp.dart';
import 'package:demo_flutter/Screen/Localization/lang_map/tr_tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('tr', 'TR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Türkçe',
    '日本語',
    'Hindi',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
    Locale('ja', 'JP'),
    Locale('hi', 'IN'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'tr_TR': trTR, // lang/tr_tr.dart
        'ja_JP': jaJP, // lang/ja_jp.dart
        'hi_IN': hiIN, // lang/ja_jp.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale ?? Locale('en', 'US');
  }
}




