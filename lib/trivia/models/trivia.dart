import 'package:tedx_dtu_app/trivia/models/question.dart';

class Trivia {
  final String imageUrl;
  final String title;
  final List<Question> questions;
  final String id;
  Trivia({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.questions,
  });
  factory Trivia.fromMap(Map<String, dynamic> map) {
    return Trivia(
      id: map['_id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      questions:
          (map['questions'] as List).map((e) => Question.fromMap(e)).toList(),
    );
  }
}
