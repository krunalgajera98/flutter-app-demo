import 'package:demo_flutter/Screen/Pagination/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationScreen extends StatelessWidget {
  static const routeName = '/PaginationScreen';
  final PaginationController _paginationController = Get.put(PaginationController());

  PaginationScreen({Key? key}) : super(key: key);

  // dataList
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          controller: _paginationController.scrollController,
          itemCount: (_paginationController.apiResModel.value.data?.length ?? 0) + 1,
          itemBuilder: (context, index) {
            print('index: ${_paginationController.apiResModel.value.data?.length}/${index}');
            if (index >= (_paginationController.apiResModel.value.data?.length ?? 0) &&
                _paginationController.paginationTeamLoader.value) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 200,
              color: Colors.yellow,
              margin: EdgeInsets.all(12),
              child: Center(
                child: Text(_paginationController.apiResModel.value.data?[index].firstName ?? ''),
              ),
            );
          },
        ),
      ),
    );
  }
}
