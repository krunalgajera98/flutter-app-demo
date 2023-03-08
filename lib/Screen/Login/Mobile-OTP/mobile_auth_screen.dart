import 'package:demo_flutter/Screen/Login/Mobile-OTP/mobile_login_controller.dart';
import 'package:demo_flutter/Widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../FireBase/Authentication/FireBaseAuthentication.dart';

class MobileAuthenticationScreen extends StatelessWidget {
  static const routeName = '/MobileAuthenticationScreen';

  MobileAuthenticationScreen({Key? key}) : super(key: key);
  final MobileLoginController _mobileLoginController = Get.put(MobileLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _mobileLoginController.mobileController,
              keyboardType: TextInputType.number,
              labelText: 'Mobile no.',
              focusNode: FocusNode(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _mobileLoginController.otpController,
              keyboardType: TextInputType.number,
              labelText: 'Enter OTP',
              focusNode: FocusNode(),
            ),
            ElevatedButton(
              onPressed: () async {
                await FireBaseAuthentication.loginWithMobileNOTP(
                    phoneNumber: _mobileLoginController.mobileController.text);
              },
              child: Text('Send otp'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FireBaseAuthentication.otpVerification(
                  smsCode: _mobileLoginController.otpController.text,
                );
              },
              child: Text('Verify otp'),
            ),
          ],
        ),
      ),
    );
  }
}
