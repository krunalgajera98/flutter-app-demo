import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/ApiCalling/api_res_service.dart';
import 'package:get/get.dart';

class ApiResController extends GetxController {
  Rx<ApiResModel> apiResModel = ApiResModel().obs;
  Rx<bool> isLoader = false.obs;

  @override
  void onInit() {
    userGetApiCall();
    super.onInit();
  }

  Future<void> userGetApiCall() async {
    try {
      isLoader.value = true;
      apiResModel.value = await ApiResService.userGetApiCall();
    } catch (e, st) {
      isLoader.value = false;
      log("Error Message: $e : $st");
    } finally {
      isLoader.value = false;
    }
  }
}
