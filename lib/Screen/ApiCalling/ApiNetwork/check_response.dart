import 'dart:convert';

import 'package:demo_flutter/Screen/ApiCalling/ApiNetwork/app_exception.dart';
import 'package:demo_flutter/Screen/ApiCalling/ApiNetwork/error_response.dart';
import 'package:http/http.dart' as http;

class ResponseHandler {
  static Future<void> checkResponseError(http.Response response, {bool showException = true}) async {
    switch (response.statusCode) {
      case 200:
        return;
      case 201:
        return;
      case 401:
        print(response.body.toString());
        // if (Get.currentRoute != Routes.signUpScreen) {
        //   AppPreference().clearSharedPreferences();
        //   AppPreference.setBoolean(Constants.keyFirstTime, value: true);
        //   Navigation.replaceAll(Routes.signUpScreen);
        // }
        var exception = AppException(
          message: "Unauthorized",
          errorCode: response.statusCode,
        );
        throw exception;
      case 500:
        print(response.body.toString());
        var exception = AppException(
          message: "No Internet",
          errorCode: response.statusCode,
        );
        throw exception;
      default:
        print(response.body.toString());
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        var exception = AppException(
          message: error.apiError?.message ?? "Something went wrong..!",
          errorCode: response.statusCode,
        );
        if (showException) exception.show();
        throw exception;
    }
  }
}
