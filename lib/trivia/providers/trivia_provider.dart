import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/question.dart';
import '../models/trivia.dart';

/// API :

class TriviaProvider extends ProviderTemplate<Trivia> {
  @override
  Trivia findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  void clearData() {
    data.clear();
    notifyListeners();
  }

  /// Fetches the questions for the trivia with the given [id], and
  /// assigns them to that trivia in [data].
  Future<void> fetchTriviaQuestions(String id) async {
    final List<Question> questions = await _fetchQuestions(id);
    findById(id).questions = questions;
  }

  /// baseUrl+/api/trivia/$id ==> fetches all the data related to that trivia
  /// including questions. If the user has attempted it before, hasAttempted flag
  /// is passed as true, otherwise false.
  /// If the user has scored points on this trivia previously, hasAttempted is true
  /// as expected, in addition a new object userTrivia is passed, containing (for now)
  /// a single value, the points that the user has scored
  /// {_id: ... , imageUrl:..., questions:[....],hasAttempted:true,userTrivia:{points:30}}
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
      print("----");
      print(jsonResponse);
      print("----");
      findById(id).hasAttempted = jsonResponse['hasAttempted'];
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

  /// The current trivia (the one on the leaderboard) is the first trivia
  /// in [data], as they are sorted by timestamps at the backend.
  Trivia get currentTrivia => data.first;

  @override
  Future<List<Trivia>> getData() async {
    print('getting data');
    try {
      final authToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      Map<String, String> headers;
      if (authToken != null) {
        headers = {
          'authorization': authToken,
        };
      } else {
        headers = {};
      }
      final url = Uri.parse(
        nodeServerBaseUrl + '/api/trivia',
      );
      print("here");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        // print(jsonDecode(response.body)['userData']); // print(data);
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<Map<String, dynamic>> data = List.from(jsonData['trivias']);

        List<Trivia> triviaList = data.map((e) => Trivia.fromMap(e)).toList();

        if (jsonData['userData'] != null &&
            jsonData['userData']['triviasAttempted'] != null) {
          List<String> attemptedTriviaIds =
              List.from(jsonData['userData']['triviasAttempted']);
          attemptedTriviaIds.forEach((id) {
            triviaList.firstWhere((element) => element.id == id).hasAttempted =
                true;
          });
        }
        return triviaList;
      } else {
        print("exception");
        throw Exception((jsonDecode(response.body) as Map)['msg']);
      }
    } on Exception catch (e) {
      print("second exception");
      throw Exception('Failed to load trivia $e');
    }
  }

  /// Sends a user's scored points to the backend to be stored.
  /// [id] is the id of the trivia that the user has attempted.
  /// [points] is the points that the user has scored in the trivia.
  Future<void> sendPoints(String id, int points, int timeTaken) async {
    findById(id).hasAttempted = true;
    notifyListeners();
    final authToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = Uri.parse(
      nodeServerBaseUrl + '/api/trivia/' + id + '/points',
    );
    final response = await http.post(url, headers: {
      'authorization': authToken,
    }, body: {
      'points': points.toString(),
      'timeTaken': timeTaken.toString(),
    });
    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.body);
      throw Exception(
          'Failed to send points ${json.decode(response.body)['msg']}');
    }
  }

  /// Sends a user's attempted status to the backend to be stored.
  /// [id] is the id of the trivia that the user has attempted.
  /// Once a trivia has been attempted, the user cannot attempt it again, even
  /// if he was unable to finish it the previous time.
  Future<void> markTriviaStarted(String id) async {
    final authToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = Uri.parse(
      nodeServerBaseUrl + '/api/user/started',
    );
    final response = await http.post(url, headers: {
      'authorization': authToken,
    }, body: {
      'triviaId': id
    });
    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.body);
      throw Exception(
          'Failed to mark trivia started ${json.decode(response.body)['msg']}');
    }
  }
}
