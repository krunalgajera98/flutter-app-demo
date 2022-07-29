import 'package:demo_flutter/Screen/SppedMeter/speddcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedoMeter extends StatelessWidget {
  static const routeName = '/SpeedoMeter';

  SpeedoMeter({Key? key}) : super(key: key);
  SpeedController _speedController = Get.put(SpeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: 200,
                        labelOffset: 30,
                        axisLineStyle:
                            AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                        majorTickStyle:
                            MajorTickStyle(length: 6, thickness: 4, color: Colors.white),
                        minorTickStyle:
                            MinorTickStyle(length: 3, thickness: 3, color: Colors.white),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    RadialAxis(
                      minimum: 0,
                      maximum: 200,
                      labelOffset: 30,
                      axisLineStyle:
                          AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                      majorTickStyle: MajorTickStyle(length: 6, thickness: 4, color: Colors.white),
                      minorTickStyle: MinorTickStyle(length: 3, thickness: 3, color: Colors.white),
                      axisLabelStyle: GaugeTextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 200,
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.03,
                            endWidth: 0.03,
                            gradient: SweepGradient(
                                colors: const <Color>[Colors.green, Colors.yellow, Colors.red],
                                stops: const <double>[0.0, 0.5, 1]))
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: _speedController.velocity.value,
                          needleLength: 0.95,
                          enableAnimation: true,
                          animationType: AnimationType.ease,
                          needleStartWidth: 1.5,
                          needleEndWidth: 6,
                          needleColor: Colors.red,
                          knobStyle: KnobStyle(knobRadius: 0.09),
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                              Text(_speedController.velocity.value.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text('var ${_speedController.velocity1.value.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text('Kmph',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ])),
                            angle: 90,
                            positionFactor: 0.75)
                      ],
                    ),
                    RadialAxis(
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 80,
                        interval: 10,
                        radiusFactor: 0.4,
                        showAxisLine: false,
                        showLastLabel: false,
                        minorTicksPerInterval: 4,
                        majorTickStyle:
                            MajorTickStyle(length: 8, thickness: 3, color: Colors.white),
                        minorTickStyle:
                            MinorTickStyle(length: 3, thickness: 1.5, color: Colors.grey),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        onLabelCreated: labelCreated),
                  ],
                ),
              ),

              ///StreamBuilder
              /*       Obx(
                  () {
                    // print('qqqq ======> ${_speedController.velocity.value}');
                    return StreamBuilder<double>(
                    stream: _speedController.streamController.value.stream,
                    builder: (BuildContext context,AsyncSnapshot<double?> velocity) {
                      print('AsyncSnapshotAsyncSnapshot ==> ${velocity.data.toString()}');
                      return SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(minimum: 0, maximum: 200, labelOffset: 30,
                            axisLineStyle: AxisLineStyle(
                                thicknessUnit: GaugeSizeUnit.factor,thickness: 0.03),
                            majorTickStyle: MajorTickStyle(length: 6,thickness: 4,color: Colors.white),
                            minorTickStyle: MinorTickStyle(length: 3,thickness: 3,color: Colors.white),
                            axisLabelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14 )
                        ),
                        RadialAxis(
                            minimum: 0,
                            maximum: 200,
                            labelOffset: 30,
                            axisLineStyle:
                                AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                            majorTickStyle: MajorTickStyle(length: 6, thickness: 4, color: Colors.white),
                            minorTickStyle: MinorTickStyle(length: 3, thickness: 3, color: Colors.white),
                            axisLabelStyle: GaugeTextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 200,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  startWidth: 0.03,
                                  endWidth: 0.03,
                                  gradient: SweepGradient(
                                      colors: const <Color>[Colors.green, Colors.yellow, Colors.red],
                                      stops: const <double>[0.0, 0.5, 1]))
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: velocity.data??0,
                                needleLength: 0.95,
                                // enableAnimation: true,
                                // animationType: AnimationType.ease,
                                needleStartWidth: 1.5,
                                needleEndWidth: 6,
                                needleColor: Colors.red,
                                knobStyle: KnobStyle(knobRadius: 0.09),
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                    Text(velocity.data?.toInt().toString()??'*',
                                        style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold)),
                                            Text(velocity.data?.toStringAsFixed(2) ??'*',
                                        style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20),
                                    Text('Kmph',
                                        style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold))
                                  ])),
                                  angle: 90,
                                  positionFactor: 0.75)
                            ],

                        ),
                        RadialAxis(startAngle: 270, endAngle: 270,minimum: 0,maximum: 80,interval: 10,radiusFactor: 0.4,
                            showAxisLine: false, showLastLabel: false, minorTicksPerInterval: 4,
                            majorTickStyle: MajorTickStyle(length: 8,thickness: 3,color: Colors.white),
                            minorTickStyle: MinorTickStyle(length: 3,thickness: 1.5,color: Colors.grey),
                            axisLabelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14 ),
                            onLabelCreated: labelCreated),
                      ],
                );
                    }
                  );
                  },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

void labelCreated(AxisLabelCreatedArgs args) {
  if (args.text == '0') {
    args.text = 'N';
    args.labelStyle = GaugeTextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14);
  } else if (args.text == '10')
    args.text = '';
  else if (args.text == '20')
    args.text = 'E';
  else if (args.text == '30')
    args.text = '';
  else if (args.text == '40')
    args.text = 'S';
  else if (args.text == '50')
    args.text = '';
  else if (args.text == '60')
    args.text = 'W';
  else if (args.text == '70') args.text = '';
}
