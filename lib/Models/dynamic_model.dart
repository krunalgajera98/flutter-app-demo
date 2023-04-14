// To parse this JSON data, do
//
//     final userDetailData = userDetailDataFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

MatchDetail matchDetailFromJson(String str) => MatchDetail.fromJson(json.decode(str));

String matchDetailToJson(MatchDetail data) => json.encode(data.toJson());

class MatchDetail {
  MatchDetail({
    required this.allTeamMatch,
    required this.totalMatch,
  });

  AllTeamMatch allTeamMatch;
  int totalMatch;

  factory MatchDetail.fromJson(Map<String, dynamic> json) {
    return MatchDetail(
      allTeamMatch: AllTeamMatch.fromJson(json["allTeamMatch"]),
      totalMatch: json["total_match"],
    );
  }

  Map<String, dynamic> toJson() => {
        "allTeamMatch": allTeamMatch.toJson(),
        "total_match": totalMatch,
      };
}

class AllTeamMatch {
  AllTeamMatch({
    required this.allDate,
  });

  List<KeyData> allDate;

  factory AllTeamMatch.fromJson(Map<String, dynamic> json) {
    List<KeyData> keyData = [];
    json.forEach((key, value) {
      log('json key(team name): $key && value(team data): $value');
      List<TeamMatchList> teamMatchList = List<TeamMatchList>.from(
        json[key].map((x) => TeamMatchList.fromJson(x)),
      );
      keyData.add(KeyData(teamName: key, keyDataList: teamMatchList));
    });
    return AllTeamMatch(
      allDate: keyData,
    );
  }

  Map<String, dynamic> toJson() => {
        'teamList': allDate == null ? [] : List<dynamic>.from(allDate.map((x) => x.toJson())),
      };
}

class TeamMatchList {
  TeamMatchList({
    required this.userId,
    required this.name,
    required this.image,
  });

  int userId;
  String name;
  String image;

  factory TeamMatchList.fromJson(Map<String, dynamic> json) => TeamMatchList(
        userId: json["userId"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "image": image,
        "name": name,
      };
}

/// model for convert dynamic key and value to specific model
class KeyData {
  List<TeamMatchList> keyDataList;
  String teamName;

  KeyData({
    this.teamName = '',
    this.keyDataList = const [],
  });

  Map<String, dynamic> toJson() => {
        "key": teamName,
        "value": keyDataList.map((e) => e.toJson()).toList(),
      };
}
