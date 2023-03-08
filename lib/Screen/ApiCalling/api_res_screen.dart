import 'package:demo_flutter/Screen/ApiCalling/api_res_controller.dart';
import 'package:demo_flutter/Widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiResScreen extends StatelessWidget {
  static const routeName = '/ApiResScreen';

  ApiResScreen({Key? key}) : super(key: key);
  final ApiResController _apiResController = Get.put(ApiResController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ApiResScreen'),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              Text('When Api Response with Dynamic Keys\n\nData not displayed only functionality.'),
              ElevatedButton(
                onPressed: () async {
                  await _apiResController.dynamicApiModel();
                },
                child: Text('Click For Get Response'),
              ),
              Divider(thickness: 2,),
              _apiResController.isLoader.value
                  ? Loader()
                  : ListView.builder(
                      itemCount: _apiResController.apiResModel.value.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${_apiResController.apiResModel.value.data?[index].avatar}',
                            ),
                          ),
                          trailing: Text('${_apiResController.apiResModel.value.data?[index].id}'),
                          title: Text(
                            '${_apiResController.apiResModel.value.data?[index].firstName} ${_apiResController.apiResModel.value.data?[index].id}',
                          ),
                          subtitle: Text('${_apiResController.apiResModel.value.data?[index].email}'),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
