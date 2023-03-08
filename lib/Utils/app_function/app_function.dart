import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFunction {
  static snackBar({required String type, required String Message}) {
    return Get.snackbar(
      type,
      Message,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      backgroundColor: type.toLowerCase().contains('error') ? Colors.red : Colors.green,
    );
  }

  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
