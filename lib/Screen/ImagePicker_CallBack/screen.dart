import 'dart:io';

import 'package:demo_flutter/Screen/ImagePicker_CallBack/image_picker_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCallBackScreen extends StatelessWidget {
  static const routeName = '/ImagePickerCallBackScreen';
  ImagePickerController _pickerController = Get.put(ImagePickerController());

  ImagePickerCallBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => _pickerController.imagePath.value != ''
                ? Image.file(
                    File(_pickerController.imagePath.value),
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  )
                : Text('Select Image From Button'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                await imagePickerDialog(context, (String path) {
                  print('ImagePickerDialog Path: $path');
                  _pickerController.imagePath.value = path;
                });
              },
              child: Text('Pick Image'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> imagePickerDialog(BuildContext context, Function(String) selectedPath) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              Get.back();
              String? path = await imagePickerFromStorage();
              // print('imagePickerDialog selected file path: $path');
              selectedPath.call(path ?? '');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Select from files',
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              Get.back();
              try {
                String? path = await imagePickerFromCamera();
                print("GetImage Crop Image Path: $path");
                selectedPath.call(path ?? '');
              } catch (e) {
                debugPrint("GetImage Error: $e");
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Take from camera',
              ),
            ),
          ),
          const SizedBox(height: 10),
        ]);
      },
    );
  }

  Future<String?> imagePickerFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    late final XFile? photo;
    photo = await _picker.pickImage(source: ImageSource.camera);
    return photo?.path ?? '';
  }

  Future<String?> imagePickerFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
      allowCompression: true,
    );
    return result?.files.single.path ?? '';
  }
}
