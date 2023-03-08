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
        "2023-02-16": List<dynamic>.from(allDate.map((x) => x.toJson())),
      };
}

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

class TeamMatchList {
  TeamMatchList({
    required this.userId,
    required this.symptomAndMoodMaster,
    required this.createdDate,
  });

  int userId;
  SymptomAndMoodMaster symptomAndMoodMaster;
  String createdDate;

  factory TeamMatchList.fromJson(Map<String, dynamic> json) => TeamMatchList(
        userId: json["userId"],
        symptomAndMoodMaster: SymptomAndMoodMaster.fromJson(json["symptomAndMoodMaster"]),
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "symptomAndMoodMaster": symptomAndMoodMaster.toJson(),
        "createdDate": createdDate,
      };
}

class SymptomAndMoodMaster {
  SymptomAndMoodMaster({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory SymptomAndMoodMaster.fromJson(Map<String, dynamic> json) => SymptomAndMoodMaster(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
