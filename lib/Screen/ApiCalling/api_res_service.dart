import 'dart:convert';
import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/ApiCalling/ApiNetwork/api.dart';
import 'package:demo_flutter/Screen/ApiCalling/ApiNetwork/check_response.dart';

class ApiResService {
  static Future<ApiResModel> userGetApiCall() async {
    try {
      /// enter end point only and get method join with base url
      var result = await Api().get('users?page=2');
      print("getInfo status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
      return ApiResModel.fromJson(jsonDecode(result.bodyBytes));
    } catch (e) {
      log("userGetApiCallWithPagination1 error : E $e");
      rethrow;
    }
  }

  static Future<ApiResModel> userGetApiCallWithPagination({int? offset}) async {
    try {
      var result = await Api().get('users?page=$offset');
      print("getInfo status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
      return ApiResModel.fromJson(jsonDecode(utf8.decode(result.bodyBytes)));
    } catch (e) {
      log("userGetApiCallWithPagination1 error : E $e");
      rethrow;
    }
  }
}
