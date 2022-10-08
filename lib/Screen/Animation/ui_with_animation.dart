import 'package:demo_flutter/Screen/Animation/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIWithAnimation extends StatefulWidget {
  static const routeName = '/UIWithAnimation';

  UIWithAnimation({Key? key}) : super(key: key);

  @override
  State<UIWithAnimation> createState() => _UIWithAnimationState();
}

class _UIWithAnimationState extends State<UIWithAnimation> with TickerProviderStateMixin {
  final AnimationScreenController _animationScreenController = Get.put(AnimationScreenController());

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _animationScreenController.startAnimation.value = !_animationScreenController.startAnimation.value;
                },
                child: Center(
                  child: Container(
                    width: 300.0,
                    height: 200.0,
                    color: Colors.red,
                    child: AnimatedAlign(
                      alignment:
                          _animationScreenController.startAnimation.value ? Alignment.topRight : Alignment.bottomLeft,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: const FlutterLogo(size: 50.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_animationScreenController.opacityLevel.value == 0.0 ||
                      _animationScreenController.opacityLevel.value == 0.2) {
                    _animationScreenController.opacityLevel.value = 1.0;
                  } else {
                    _animationScreenController.opacityLevel.value = 0.2;
                  }
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.yellow,
                  child: AnimatedOpacity(
                    opacity: _animationScreenController.opacityLevel.value,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(),
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                width: 200,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      width: _animationScreenController.animatedPositioned.value ? 180.0 : 50.0,
                      height: _animationScreenController.animatedPositioned.value ? 50.0 : 100.0,
                      top: _animationScreenController.animatedPositioned.value ? 10.0 : 100.0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: GestureDetector(
                        onTap: () {
                          _animationScreenController.animatedPositioned.value =
                              !_animationScreenController.animatedPositioned.value;
                        },
                        child: Container(
                          color: Colors.blue,
                          child: const Center(child: Text('Tap me')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RotationTransition(
                turns: _animation,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlutterLogo(size: 150.0),
                ),
              ),
              SlideTransition(
                position: _offsetAnimation,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlutterLogo(size: 150.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
