import 'package:get/get.dart';

class AnimationScreenController extends GetxController {
  RxBool startAnimation = false.obs;
  RxBool animatedPositioned = false.obs;
  RxDouble opacityLevel = 0.5.obs;
}
