import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final int seconds;
  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.seconds = 10,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
      options: List<String>.from(map['options']),
      correctAnswerIndex: map['correctAnswerIndex']?.toInt() ?? 0,
      seconds: map['seconds']?.toInt() ?? 10,
    );
  }
}
