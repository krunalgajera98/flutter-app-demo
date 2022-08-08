import 'dart:convert';
import 'dart:developer';

import 'package:demo_flutter/Screen/FaceBookLogin/login_data_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FaceBookLoginController extends GetxController {
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  Rx<LoginDataModel> loginDetail = LoginDataModel().obs;
  static const String faceBookToken =
      "EAAXoNo8fDgwBAL3hvhs8fLltWFBbvwZAhyoVSDys1DkOKHw1JgZCgZApqyXN6rb3pOWMqnNGo7AcfBVXKCyRNi8he8fonhoZCzwVVubyHq9pZCYDvBxc8yElIN2RiZCjsYDtmLh9jZCtuFq0fZCTg5TR5ZB5ZCOAjZCO4LabiFyYX5ZAGWqXgZBgviZAIoxCajyHdKnC6t5DuffHjsI9oJKl0ZAtN05yWILGggcQpV9XKtc4frLaIil4WZBYQcZBr";

  Future<void> initiateFacebookLogin() async {
    if (faceBookToken.isNotEmpty) {
      return;
    }
    LoginResult loginResult = await _facebookAuth.login(permissions: ['email', 'public_profile', 'user_birthday']);
    switch (loginResult.status) {
      case LoginStatus.success:
        print('LoginStatus: success');
        final AccessToken accessToken = loginResult.accessToken!;
        log("result.status ===> ${accessToken.toJson()}");
        // faceBookToken = accessToken.token;
        final userData = await _facebookAuth.getUserData();
        loginDetail.value = await LoginDataModel.fromJson(userData);
        break;
      case LoginStatus.cancelled:
        print('LoginStatus: cancelled');

        break;
      case LoginStatus.failed:
        print('LoginStatus: failed');

        break;
      case LoginStatus.operationInProgress:
        print('LoginStatus: operationInProgress');
        break;
    }
  }

  Future<void> logOut() async {
    try {
      final AccessToken? accessToken = await _facebookAuth.accessToken;
      if (accessToken != null) {
        _facebookAuth.logOut();
      }
      return;
    } catch (e, st) {
      print('FacebookAuth logOut : $e && $st');
    }
  }

  Future<void> getDataFromFaceBookToken(String token) async {
    var graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$faceBookToken'));
    var profile = json.decode(graphResponse.body);
    print(profile.toString());
    log("Login User Data profile.toString()===> ${profile.toString()}");
  }
}
