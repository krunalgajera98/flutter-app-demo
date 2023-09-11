import 'package:demo_flutter/Screen/Pagination/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationScreen extends StatelessWidget {
  static const routeName = '/PaginationScreen';
  final PaginationController _paginationController = Get.put(PaginationController());

  PaginationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: _paginationController.scrollController,
                itemCount: (_paginationController.apiResModel.value.data?.length ?? 0),
                itemBuilder: (context, index) {
                  var data = _paginationController.apiResModel.value.data;
                  print('index: ${data?.length}/${index}');
                  return Container(
                    height: 200,
                    color: Colors.yellow,
                    margin: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                          (data?[index].id.toString() ?? '') + '\t-\t' + (data?[index].firstName.toString() ?? '')),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => Visibility(
                visible: _paginationController.paginationLoader.value,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
      /*body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          controller: _paginationController.scrollController,
          itemCount: _paginationController.paginationLoader.value
              ? (_paginationController.apiResModel.value.data?.length ?? 0) + 1
              : (_paginationController.apiResModel.value.data?.length ?? 0),
          itemBuilder: (context, index) {
            var data = _paginationController.apiResModel.value.data;
            print('index: ${data?.length}/${index}');
            if (index >= (data?.length ?? 0) && _paginationController.paginationLoader.value) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return Container(
              height: 200,
              color: Colors.yellow,
              margin: EdgeInsets.all(12),
              child: Center(
                child: Text((data?[index].id.toString() ?? '') + '\t-\t' + (data?[index].firstName.toString() ?? '')),
              ),
            );
          },
        ),
      ),*/
    );
  }
}
