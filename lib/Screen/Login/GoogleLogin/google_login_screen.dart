import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_login_controller.dart';

class GoogleLoginScreen extends StatelessWidget {
  static const routeName = '/GoogleLoginScreen';

  GoogleLoginScreen({Key? key}) : super(key: key);
  final GoogleLoginController _googleLoginController = Get.put(GoogleLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: _googleLoginController.currentUser != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ListTile(
                      leading: GoogleUserCircleAvatar(
                        identity: _googleLoginController.currentUser!,
                      ),
                      title: Text(_googleLoginController.currentUser!.displayName ?? ''),
                      subtitle: Text(_googleLoginController.currentUser!.email),
                    ),
                    const Text('Signed in successfully.'),
                    Text(_googleLoginController.contactText),
                    ElevatedButton(
                      onPressed: _googleLoginController.googleSignOut,
                      child: const Text('SIGN OUT'),
                    ),
                    ElevatedButton(
                      child: const Text('REFRESH'),
                      onPressed: () => _googleLoginController.handleGetContact(_googleLoginController.currentUser!),
                    ),
                  ],
                )
              : _googleLoginController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text('You are not currently signed in.'),
                        ElevatedButton(
                          onPressed: _googleLoginController.googleSignIn,
                          child: const Text('SIGN IN'),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
