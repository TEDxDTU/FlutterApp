import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Model for the questions present in each trivia.
class Question {
  /// The question statement.
  final String question;

  /// The list of MCQ options.
  final List<String> options;

  /// The correct answer index, from [options].
  final int correctAnswerIndex;

  /// The total time allowed for the question.
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
