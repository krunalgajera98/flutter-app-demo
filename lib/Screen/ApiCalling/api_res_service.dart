import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/ApiCalling/network_helper.dart';

class ApiResService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<ApiResModel> userGetApiCall() async {
    try {
      final request = await _networkAPICall.get('users?page=2');
      if (request != null) {
        return ApiResModel.fromJson(request);
      }
    } catch (e) {
      log("Discover Api Error $e");
      rethrow;
    } finally {
      //loader end
    }
    return ApiResModel();
  }

  static Future<ApiResModel> userGetApiCallWithPagination({int? offset}) async {
    try {
      final request = await _networkAPICall.get('users?page=$offset');
      if (request != null) {
        return ApiResModel.fromJson(request);
      }
    } catch (e) {
      log("Discover Api Error $e");
      rethrow;
    } finally {
      //loader end
    }
    return ApiResModel();
  }
}
