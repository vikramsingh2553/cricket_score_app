import 'package:cricket_score_app/model/info_model.dart';
import 'package:cricket_score_app/model/score_info.dart';
import 'package:cricket_score_app/model/score_info_model.dart';

class MatchApiResponse {
  String? apikey;
  List<MatchInfo>? matchInfoList;
  String? status;
  ScoreInformation? info;
  ScoreInfo? scoreInfo;

  MatchApiResponse({this.apikey, this.matchInfoList, this.status, this.info, this.scoreInfo});

  MatchApiResponse.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != '') {
      matchInfoList = <MatchInfo>[];
      json['data'].forEach((v) {
        matchInfoList!.add(MatchInfo.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? ScoreInformation.fromJson(json['info']) : null;
    scoreInfo = json['scoreInformation'] != null ? ScoreInfo.fromJson(json['scoreInformation']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apikey'] = apikey;
    if (matchInfoList != '') {
      data['data'] = matchInfoList!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (info != '') {
      data['info'] = info!.toJson();
    }
    if (scoreInfo != '') {
      data['scoreInformation'] = scoreInfo!.toJson();
    }
    return data;
  }
}
