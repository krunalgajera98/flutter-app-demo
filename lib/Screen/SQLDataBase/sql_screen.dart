import 'package:demo_flutter/Screen/ApiCalling/api_res_controller.dart';
import 'package:demo_flutter/Screen/SQLDataBase/service/api_res_database_api.dart';
import 'package:demo_flutter/Screen/SQLDataBase/sql_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SQLScreen extends StatelessWidget {
  static const routeName = '/SQLScreen';

  SQLScreen({Key? key}) : super(key: key);
  final SQLController _sQLController = Get.put(SQLController());
  final ApiResController _apiResController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SQL DataBase'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  _apiResController.apiResModel.value.data?.forEach((element) async {
                    await AppResDataBase.saveData(element);
                    refresh();
                  });
                },
                child: Text('Api call/SaveData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  _sQLController.dataList.value = await AppResDataBase.getData();
                  print('dataList Length: ${_sQLController.dataList.length}');
                  Get.snackbar(_sQLController.dataList.isEmpty ? 'Error' : 'Success',
                      _sQLController.dataList.isEmpty ? 'No Data Found in Storage' : 'Fetch Data Successfully!',
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Text('GetData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AppResDataBase.deleteData();
                  refresh();
                },
                child: Text('DeleteData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AppResDataBase.getDataByItems(name: 'Michael',id: 7);
                  // refresh();
                },
                child: Text('getDataByItems'),
              ),
              Obx(
                () {
                  print(_apiResController.isLoader);
                  return Expanded(
                    child: _sQLController.dataList.isEmpty
                        ? Center(child: Text('No Data Saved from Local Storage!'))
                        : ListView.builder(
                            itemCount: _sQLController.dataList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage('${_sQLController.dataList[index].avatar}'),
                                ),
                                trailing: Text('${_sQLController.dataList[index].id}'),
                                title: Text(
                                    '${_sQLController.dataList[index].firstName} ${_sQLController.dataList[index].lastName}'),
                                subtitle: Text('${_sQLController.dataList[index].email}'),
                              );
                            }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refresh() async {
    _sQLController.dataList.value = await AppResDataBase.getData();
  }
}
