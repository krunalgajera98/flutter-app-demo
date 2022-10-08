import 'dart:convert';

import 'package:demo_flutter/Screen/ApiCalling/ApiNetwork/app_exception.dart';
import 'package:http/http.dart' as http;

dynamic checkResponse(http.Response response) {
  try {
    switch (response.statusCode) {
      case 200:
        try {
          if (response.body.isEmpty) {
            throw AppException(message: 'Response body is empty', errorCode: 0);
          }
          return jsonDecode(response.body);
        } catch (e) {
          rethrow;
        }
      default:
        try {
          if (response.body.isEmpty) {
            throw AppException(message: 'Response body is empty', errorCode: response.statusCode);
          }
          final Map<String, dynamic> data = jsonDecode(response.body);
          throw AppException(message: "error : ${data['Error']}", errorCode: response.statusCode);
        } catch (e) {
          rethrow;
        }
    }
  } catch (e) {
    rethrow;
  }
}
