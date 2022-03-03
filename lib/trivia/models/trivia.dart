import 'package:flutter/cupertino.dart';
import 'package:tedx_dtu_app/trivia/models/question.dart';

class Trivia {
  final String imageUrl;
  final String title;
  List<Question>? questions;
  final String id;
  Trivia({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.questions,
  });

  int get questionCount => questions?.length ?? -1;
  int get totalTime =>
      questions?.fold<int>(0, (prev, q) => prev + q.seconds) ?? -1;
  factory Trivia.fromMap(Map<String, dynamic> map) {
    return Trivia(
      id: map['_id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      questions:
          (map['questions'] as List?)?.map((e) => Question.fromMap(e)).toList(),
    );
  }

  void assignQuestions(List<Question> questions) {
    this.questions = questions;
  }
}
