import 'package:demo_flutter/Models/user_model.dart';
import 'package:demo_flutter/Screen/SharePreference/SharePrefController.dart';
import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharePrefScreen extends StatelessWidget {
  static const routeName = '/SharePrefScreen';
  final SharePrefController _sharePrefController = Get.put(SharePrefController());

  SharePrefScreen({Key? key}) : super(key: key);

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
                  User user = User(
                    email: 'krunalgajera98@gmail.com',
                    isIDVerified: true,
                    phoneNo: 8140500528,
                  );
                  await SharedPrefs.saveUser(user);
                  refresh();
                },
                child: Text('SaveData in SharePref'),
              ),
              ElevatedButton(
                onPressed: () async {
                  _sharePrefController.user.value = await SharedPrefs.getUser() ?? User();
                  Get.snackbar(
                      _sharePrefController.user.value.email?.isEmpty ?? true ? 'Error' : 'Success',
                      _sharePrefController.user.value.email?.isEmpty ?? true
                          ? 'No Data Found in Storage'
                          : 'Fetch Data Successfully!',
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Text('GetData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await SharedPrefs.clearUser();
                  refresh();
                },
                child: Text('DeleteData'),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () {
                  return Column(
                    children: [
                      Text('PhoneNo: ${_sharePrefController.user.value.phoneNo.toString()}'),
                      Text(
                          'isIDVerified: ${_sharePrefController.user.value.isIDVerified.toString()}'),
                      Text('Email: ${_sharePrefController.user.value.email.toString()}'),
                    ],
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
    _sharePrefController.user.value = await SharedPrefs.getUser() ?? User();
  }
}
