import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 180,
          child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase, // ballRotateChase, lineScale, ballSpinFadeLoader
            colors: const [
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.orange,
              Colors.red,
            ],
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
