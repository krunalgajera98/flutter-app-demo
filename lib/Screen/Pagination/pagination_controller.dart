import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/ApiCalling/api_res_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  Rx<bool> paginationTeamLoader = false.obs;
  Rx<bool> isLoader = false.obs;
  RxInt offset = 1.obs;
  int perPage = 2; //generally 10
  ScrollController scrollController = ScrollController();
  Rx<ApiResModel> apiResModel = ApiResModel(data: []).obs;
  ApiResModel result = ApiResModel();

  void onInit() {
    userGetApiCallWithPagination(offset: 1);
    scrollController.addListener(Pagination);
    super.onInit();
  }

  Future<void> Pagination() async {
    if ((scrollController.position.pixels == scrollController.position.maxScrollExtent)) {
      if (result.data!.isEmpty || (result.data?.length ?? 0) < perPage) {
        log('Error: offset Not found');
      } else {
        paginationTeamLoader.value = true;
        offset.value += 1;
        log('offset index: ${offset.value}');
        await userGetApiCallWithPagination(offset: offset.value);
        paginationTeamLoader.value = false;
      }
    }
  }

  Future<void> userGetApiCallWithPagination({int? offset}) async {
    try {
      isLoader.value = true;
      result = await ApiResService.userGetApiCallWithPagination(offset: offset);
      apiResModel.value.data?.addAll(result.data ?? []);
      apiResModel.refresh();
    } catch (e, st) {
      isLoader.value = false;
      log("Error Message: $e : $st");
    } finally {
      isLoader.value = false;
    }
  }
}
