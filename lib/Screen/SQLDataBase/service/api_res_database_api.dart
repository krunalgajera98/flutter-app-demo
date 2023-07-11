import 'dart:developer';

import 'package:demo_flutter/Models/api_res_model.dart';
import 'package:demo_flutter/Screen/SQLDataBase/service/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppResDataBase {
  static DatabaseHelper databaseHelper = DatabaseHelper();
  static const String tableName = 'UserData';

  /// save data to local storage   ('UserData' TableName)
  static Future<int> saveData(ApiResData apiResDataList) async {
    var dbClient = await databaseHelper.db;
    int res = await dbClient.insert(tableName, apiResDataList.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    log('dbClient response $res');
    return res;
  }

  /// get data from local storage
  static Future<List<ApiResData>> getData() async {
    var dbClient = await databaseHelper.db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableName');
    List<ApiResData> apiResDataList = [];

    for (int i = 0; i < list.length; i++) {
      apiResDataList.add(ApiResData.fromJson(list[i]));
    }
    return apiResDataList;
  }

  static Future<List<ApiResData>> getDataByItems({required String name, required int id}) async {
    //Michael // 7
    var dbClient = await databaseHelper.db;
    try {
      List<Map<String, dynamic>> list =
          await dbClient.rawQuery('SELECT * FROM $tableName WHERE first_name = ? and id = ?', [name, id]);
      // List<Map<String, dynamic>> list = await db.query(DatabaseHelper.table,
      //    columns: ['first_name', 'id'],
      //    where: '${DatabaseHelper.columnId} = ?',
      //    whereArgs: [name,id]);
      log('getDataByItems 00: ${list.length}');
      List<ApiResData> geoFencingData = [];
      for (int i = 0; i < list.length; i++) {
        geoFencingData.add(ApiResData.fromJson(list[i]));
      }
      log('getDataByItems 01: ${geoFencingData.length}');
      return geoFencingData;
    } catch (e, st) {
      log('getData dataList ====> $e && st : $st');
    }
    return [];
  }

  /// delete data to local storage
  static Future<int> deleteData() async {
    var dbClient = await databaseHelper.db;
    int index = await dbClient.delete(tableName);
    return index;
  }
}
