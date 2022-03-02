import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/trivia.dart';

class TriviaProvider extends ProviderTemplate<Trivia> {
  @override
  Trivia findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  Trivia get currentTrivia => data.first;

  @override
  Future<List<Trivia>> getData() async {
    try {
      final url = Uri.parse(nodeServerBaseUrl + '/api/trivia');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
        List<Trivia> triviaList = data.map((e) => Trivia.fromMap(e)).toList();
        return triviaList;
      } else {
        throw Exception((jsonDecode(response.body) as Map)['msg']);
      }
    } on Exception catch (e) {
      throw Exception('Failed to load trivia $e');
    }
  }
}
