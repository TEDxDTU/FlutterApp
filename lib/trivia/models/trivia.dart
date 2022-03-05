import 'package:flutter/cupertino.dart';

import 'package:tedx_dtu_app/trivia/models/question.dart';

class Trivia {
  final String imageUrl;
  final String title;
  List<Question>? questions;
  final String id;
  final int questionCount;
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
}
