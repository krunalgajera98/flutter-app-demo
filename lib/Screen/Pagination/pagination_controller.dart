import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/ApiCalling/api_res_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  Rx<bool> paginationLoader = false.obs;
  Rx<bool> isLoader = false.obs;
  RxInt offset = 1.obs; // offset means total page
  int perPage = 2; //generally 10
  ScrollController scrollController = ScrollController();
  Rx<ApiResModel> apiResModel = ApiResModel(data: []).obs;
  ApiResModel result = ApiResModel();

  void onInit() {
    userGetApiCallWithPagination(currentPage: 1);
    scrollController.addListener(Pagination);
    super.onInit();
  }

  Future<void> Pagination() async {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 &&
        paginationLoader.value == false) {
      if (result.data!.isEmpty || (result.data?.length ?? 0) < perPage) {
        log('Error: offset Not found');
      } else {
        paginationLoader.value = true;
        log('offset index: ${offset.value}');

        await Future.delayed(
            Duration(seconds: 3)); //  ❌ This Delay was added to just see loader effect, Remove it when in actual use
        await userGetApiCallWithPagination(currentPage: offset.value);
        paginationLoader.value = false;
      }
    }
  }

  Future<void> userGetApiCallWithPagination({int? currentPage}) async {
    try {
      isLoader.value = true;
      result = await ApiResService.userGetApiCallWithPagination(offset: currentPage);
      offset.value += 1;
      apiResModel.value.data?.addAll(result.data ?? []);
      apiResModel.refresh();
    } catch (e, st) {
      isLoader.value = false;
      log("Error Message : $e : $st");
    } finally {
      isLoader.value = false;
    }
  }
}
