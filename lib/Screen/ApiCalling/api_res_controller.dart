import 'dart:convert';
import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Models/dynamic_model.dart';
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

  ///  When api response with dynamic keys

  Future<void> dynamicApiModel() async {
    try {
      var data = MatchDetail.fromJson(jsonDecode(jsonModel));
      log("dynamicApiModel 00: ${data.toJson()}");
    } catch (e) {
      log("dynamicApiModel error : E $e");
      rethrow;
    }
  }
}

/// As a example we use static api response with dynamic keys

var jsonModel = jsonEncode({
  "allTeamMatch": {
    "INDIA": [
      {
        "userId": 230,
        "symptomAndMoodMaster": {
          "name": "Doing fIne",
          "image":
              "http://storage.haua.com.s3.me-central-1.amazonaws.com/dev/1/symptoms-and-moods/131/1675823592104.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230216T021433Z&X-Amz-SignedHeaders=host&X-Amz-Expires=28799&X-Amz-Credential=AKIAR3PLMUOCV6DNGK5R%2F20230216%2Fme-central-1%2Fs3%2Faws4_request&X-Amz-Signature=ccb0607e9f3891d3720c1c32eacb03706509d0a86a697dff84b46f9b7ad641e5"
        },
        "createdDate": "2023-02-16"
      },
      {
        "userId": 230,
        "symptomAndMoodMaster": {
          "name": "Happy",
          "image":
              "http://storage.haua.com.s3.me-central-1.amazonaws.com/dev/1/symptoms-and-moods/131/1675823568294.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230216T021433Z&X-Amz-SignedHeaders=host&X-Amz-Expires=28799&X-Amz-Credential=AKIAR3PLMUOCV6DNGK5R%2F20230216%2Fme-central-1%2Fs3%2Faws4_request&X-Amz-Signature=9ec2b39e5a3dd19575f72299f8d82e0b63ad0672e1336bb27f5ba4f2c9b23be9"
        },
        "createdDate": "2023-02-16"
      }
    ],
    "PAKISTAN": [
      {
        "userId": 240,
        "symptomAndMoodMaster": {
          "name": "Doing fIne",
          "image":
              "http://storage.haua.com.s3.me-central-1.amazonaws.com/dev/1/symptoms-and-moods/131/1675823592104.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230216T021433Z&X-Amz-SignedHeaders=host&X-Amz-Expires=28799&X-Amz-Credential=AKIAR3PLMUOCV6DNGK5R%2F20230216%2Fme-central-1%2Fs3%2Faws4_request&X-Amz-Signature=ccb0607e9f3891d3720c1c32eacb03706509d0a86a697dff84b46f9b7ad641e5"
        },
        "createdDate": "2023-02-16"
      },
    ],
  },
  "total_match": 3
});
