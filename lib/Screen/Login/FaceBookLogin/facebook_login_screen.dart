import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'facebook_login_controller.dart';

class FaceBookLoginScreen extends StatelessWidget {
  static const routeName = '/FaceBookLoginScreen';

  FaceBookLoginScreen({Key? key}) : super(key: key);
  final FaceBookLoginController _faceBookLoginController = Get.put(FaceBookLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _faceBookLoginController.loginDetail.value.email == null ||
                    (_faceBookLoginController.loginDetail.value.email?.isEmpty ?? true)
                ? SizedBox()
                : ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(_faceBookLoginController.loginDetail.value.picture?.data?.url.toString() ?? ''),
                    ),
                    title: Text(_faceBookLoginController.loginDetail.value.name.toString()),
                    subtitle: Text(_faceBookLoginController.loginDetail.value.email.toString()),
                  ),
            ElevatedButton(
              onPressed: () {
                _faceBookLoginController.initiateFacebookLogin();
              },
              child: Text('FaceBook Login'),
            ),
            ElevatedButton(
              onPressed: () {
                _faceBookLoginController.logOut();
              },
              child: Text('FaceBook Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
