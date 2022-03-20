import 'dart:convert';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:tedx_dtu_app/trivia/models/contestant.dart';
import 'package:http/http.dart' as http;

class LeaderboardProvider extends ProviderTemplate<Contestant> {
  @override
  Contestant findById(String id) {
    return data.firstWhere((element) => element.firebaseID == id);
    // throw UnimplementedError();
  }

  @override
  Future<List<Contestant>> getData() async {
    final url = Uri.parse(nodeServerBaseUrl + '/api/trivia/leaderboard');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return (jsonResponse as List)
          .map(
            (e) => Contestant.fromMap(e),
          )
          .toList();
    } else {
      throw Exception(
          'Failed to load leaderboard ${json.decode(response.body)['msg']}');
    }
  }
}
