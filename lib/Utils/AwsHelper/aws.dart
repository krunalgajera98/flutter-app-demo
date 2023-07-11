import 'dart:io';

import 'package:aws_s3/aws_s3.dart';
import 'package:flutter/material.dart';

class AWSHelper {
  static Future<void> awsInit() async {
    try {
      final AwsS3 awsS3 = AwsS3(
        awsFolderPath: '',
        file: File(''),
        fileNameWithExt: '',
        poolId: '',
        region: Regions.AP_SOUTH_1,
        bucketName: 'AppString.bucketName',
      );
      await awsS3.initAWS(
        'AppString.awsAccessKey',
        'AppString.awsSecretKey',
      );
    } catch (e) {
      debugPrint("AWS Error-->$e");
    }
  }

  static Future<String?> uploadDocuments(File file) async {
    final AwsS3 awsS3 = AwsS3(
      awsFolderPath: "",
      file: file,
      fileNameWithExt: file.path.split("/").last,
      poolId: '',
      region: Regions.AP_SOUTH_1,
      bucketName: AppString.bucketName,
    );
    try {
      final String? uploadedFileName = await awsS3.uploadFile;
      debugPrint("uploadedFileName 00--> $uploadedFileName");
      return uploadedFileName;
    } catch (e) {
      rethrow;
    }
  }
}
