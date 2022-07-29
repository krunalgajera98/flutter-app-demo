import 'package:demo_flutter/Models/user_model.dart';
import 'package:get/get.dart';

class SharePrefController extends GetxController {
  Rx<User> user = User().obs;
}
