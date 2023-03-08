// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
//
// import 'package:flutter/services.dart';
//
// class FBStorage {
//   /// upload file image and get http url from firebase
//   static Future uploadFile(String imagePath) async {
//     if (imagePath == '') return;
//     Uint8List bytes = await File(imagePath).readAsBytes();
//
//     Reference ref = FirebaseStorage.instance.ref().child('ImageStorage/image-name');
//     UploadTask uploadTask = ref.putData(bytes, SettableMetadata(contentType: 'image/jpg'));
//     TaskSnapshot taskSnapshot =
//         await uploadTask.whenComplete(() => print('done')).catchError((error) => print('something went wrong'));
//     String url = await taskSnapshot.ref.getDownloadURL();
//     log('uploadFile url: $url');
//   }
// }
