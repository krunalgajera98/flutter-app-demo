///
// SHA1: B8:11:21:CF:C1:A4:96:BD:FE:79:7E:B5:2D:1D:2C:4D:17:8F:BD:8F
// Client ID : 1080530228729-tmitcc2nifbekivu58lmnlt9h41qoghj.apps.googleusercontent.com
// Client Secret: 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
///
import 'dart:convert' show json;
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleLoginController extends GetxController {
  GoogleSignInAccount? currentUser;
  String contactText = '';
  RxBool isLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['profile', 'email'],
  );

  @override
  void onInit() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
      if (currentUser != null) {
        handleGetContact(currentUser!);
      }
    });
    _googleSignIn.signInSilently();
    super.onInit();
  }

  Future<void> googleSignIn() async {
    try {
      /// make sure you enable google login in firebase console
      isLoading.value = true;
      await _googleSignIn.signIn();
      isLoading.value = false;
    } catch (error, st) {
      log('handleSignIn error ===> $error && st: $st');
      isLoading.value = false;
    }
  }

  void googleSignOut() {
    _googleSignIn.disconnect();
  }

  String? pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> handleGetContact(GoogleSignInAccount user) async {
    contactText = 'Loading contact info...';

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      contactText = 'People API gave a ${response.statusCode} '
          'response. Check logs for details.';

      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = pickFirstNamedContact(data);

    if (namedContact != null) {
      contactText = 'I see you know $namedContact!';
    } else {
      contactText = 'No contacts to display.';
    }
  }
}
