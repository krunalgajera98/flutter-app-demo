import 'package:demo_flutter/Screen/SharePreference/controller.dart';
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
          title: Text('SharedPrefs DataBase'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await SharedPrefs.setString(key: PrefString.email, value: 'krunalgajera98@gmail.com');
                  await SharedPrefs.setBool(key: PrefString.isIDVerified, value: true);
                  await SharedPrefs.setInt(key: PrefString.phoneNo, value: 8140500528);
                },
                child: Text('SaveData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  _sharePrefController.getUser();
                },
                child: Text('GetData'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await SharedPrefs.clearUser();
                },
                child: Text('DeleteData'),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                ()=>Column(
                  children: [
                    Text('PhoneNo: ${_sharePrefController.phoneNo.value.toString()}'),
                    Text('isIDVerified: ${_sharePrefController.isIDVerified.value.toString()}'),
                    Text('Email: ${_sharePrefController.email.value.toString()}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
