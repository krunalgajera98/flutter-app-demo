import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/SQLDataBase/service/db_helper.dart';

class AppResDataBase {
  static DatabaseHelper databaseHelper = DatabaseHelper();

  /// save data to local storage   ('UserData' TableName)
  static Future<int> saveData(ApiResData apiResDataList) async {
    var dbClient = await databaseHelper.db;
    int res = await dbClient.insert("UserData", apiResDataList.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    log('dbClient response $res');
    return res;
  }

  /// get data from local storage
  static Future<List<ApiResData>> getData() async {
    var dbClient = await databaseHelper.db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM UserData');
    List<ApiResData> apiResDataList = [];

    for (int i = 0; i < list.length; i++) {
      apiResDataList.add(ApiResData.fromJson(list[i]));
    }
    return apiResDataList;
  }

  /// delete data to local storage
  static Future<int> deleteData() async {
    var dbClient = await databaseHelper.db;
    int index = await dbClient.delete('UserData');
    return index;
  }
}
