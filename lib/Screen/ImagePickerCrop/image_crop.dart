import 'dart:async';
import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageScanner extends StatelessWidget {
  static const routeName = '/ImageScanner';

  ImageScanner({Key? key}) : super(key: key);
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    var argumentData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print("rcvdData ${argumentData['UserId']}");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: getImage,
                  child: Text('Scan'),
                ),
              ),
              SizedBox(height: 20),
              Text('Cropped image path:'),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                child: Text(
                  _imagePath.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Visibility(
                visible: _imagePath != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(_imagePath ?? ''),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    String? imagePath;

    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("getImage : $imagePath");
    } on PlatformException catch (e) {
      imagePath = e.toString();
    }
    print('_imagePath : $_imagePath');
  }
}
