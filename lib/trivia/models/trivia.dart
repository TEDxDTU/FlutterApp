import 'package:flutter/cupertino.dart';

import 'package:tedx_dtu_app/trivia/models/question.dart';

/// A class to hold Trivia details.
class Trivia {
  /// The unique ID of the trivia.
  final String id;

  /// The title of the trivia.
  final String title;

  /// The URL to the thumbnail of the trivia.
  final String imageUrl;

  /// The list of [Question]s in the trivia
  List<Question>? questions;

  /// The total number of questions. It is equal to [questions.length],
  /// but it is populated before questions is populated, if at all. Questions
  /// are populated when a user wishes to play that particular trivia.
  /// The [questionCount] and [totalTime] fields are populated on the initial
  /// fetch itself, to display the basic details.
  final int questionCount;

  /// The total time allowed for the trivia.
  /// Is equal to sum of [Question.seconds] of all [Question]s in the trivia.
  final int totalTime;
  Trivia({
    required this.imageUrl,
    required this.title,
    this.questions,
    required this.id,
    required this.questionCount,
    required this.totalTime,
  });

  factory Trivia.fromMap(Map<String, dynamic> map) {
    return Trivia(
      id: map['_id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      questions:
          (map['questions'] as List?)?.map((e) => Question.fromMap(e)).toList(),
      questionCount: map['questionCount'],
      totalTime: map['totalTime'],
    );
  }

  void assignQuestions(List<Question> questions) {
    this.questions = questions;
  }

  @override
  String toString() {
    return 'id: $id | title: $title | questions: $questions | questionCount: $questionCount | totalTime: $totalTime | imageUrl: $imageUrl';
  }
}
