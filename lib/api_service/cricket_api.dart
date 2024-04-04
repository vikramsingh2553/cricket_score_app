import 'dart:convert';
import 'package:cricket_score_app/api_service/api_end_point.dart';
import 'package:cricket_score_app/api_service/match_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MatchApiService {
  static Future<MatchApiResponse> getMatchInformation() async {
    http.Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }

      final result = jsonDecode(response.body);
      return MatchApiResponse.fromJson(result);

    } else {
      throw 'Something went wrong';
    }
  }
}