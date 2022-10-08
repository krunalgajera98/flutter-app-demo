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
              focusNode: FocusNode(),
              labelText: 'Mobile no.',
              obscureText: false,
              validator: (val) {
                return null;
              },
              suffixIconTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _mobileLoginController.otpController,
              keyboardType: TextInputType.number,
              focusNode: FocusNode(),
              labelText: 'Enter OTP',
              obscureText: false,
              validator: (val) {
                return null;
              },
              suffixIconTap: () {},
            ),
            ElevatedButton(
              onPressed: () async {
                await FireBaseAuthentication.loginWithMobileNOTP(
                    phoneNumber: _mobileLoginController.mobileController.text);
              },
              child: Text('Send otp'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify otp'),
            ),
          ],
        ),
      ),
    );
  }
}
