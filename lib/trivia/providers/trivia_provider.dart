import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/question.dart';
import '../models/trivia.dart';

class TriviaProvider extends ProviderTemplate<Trivia> {
  @override
  Trivia findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  Future<void> fetchTriviaQuestions(String id) async {
    final List<Question> questions = await _fetchQuestions(id);
    findById(id).questions = questions;
  }

  Future<List<Question>> _fetchQuestions(String id) async {
    print(nodeServerBaseUrl + '/api/trivia/' + id);
    var authToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    // authToken = authToken.replaceAll("f", 'e');
    final response = await http
        .get(Uri.parse(nodeServerBaseUrl + '/api/trivia/' + id), headers: {
      'authorization': authToken,
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      List<Question> questions = (jsonResponse['questions'] as List)
          .map((e) => Question.fromMap(e))
          .toList();
      return questions;
    } else {
      print(response.body);
      throw Exception(
          'Failed to load trivia questions ${json.decode(response.body)['msg']}');
    }
  }

  Trivia get currentTrivia => data.first;

  @override
  Future<List<Trivia>> getData() async {
    print('getting data');
    try {
      // final authToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      final url = Uri.parse(
        nodeServerBaseUrl + '/api/trivia',
      );

      final response = await http.get(url, headers: {});
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
        // print(data);
        List<Trivia> triviaList = data.map((e) => Trivia.fromMap(e)).toList();
        // List<Question> currTriviaQuestions =
        //     await _fetchQuestions(triviaList[0].id);
        // triviaList.first.questions = currTriviaQuestions;
        return triviaList;
      } else {
        throw Exception((jsonDecode(response.body) as Map)['msg']);
      }
    } on Exception catch (e) {
      throw Exception('Failed to load trivia $e');
    }
  }

  Future<void> sendPoints(String id, int points) async {
    final authToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = Uri.parse(
      nodeServerBaseUrl + '/api/trivia/' + id + '/points',
    );
    final response = await http.post(url, headers: {
      'authorization': authToken,
    }, body: {
      'points': points.toString(),
    });
    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.body);
      throw Exception(
          'Failed to send points ${json.decode(response.body)['msg']}');
    }
  }
}
