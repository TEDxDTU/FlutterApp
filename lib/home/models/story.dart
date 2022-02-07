import 'dart:convert';

import 'package:tedx_dtu_app/events/models/speaker.dart';

class Story {
  final String title;
  final String description;
  final String imageUrl;
  final String id;
  final Speaker speaker;
  final DateTime dateTime;
  Story({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.id,
    required this.speaker,
    required this.dateTime,
  });

  factory Story.fromMap(Map<String, dynamic> map) {
    // print(map);
    return Story(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      dateTime: DateTime.parse(map['dateTime']),
      id: map['id'] ?? '',
      speaker: Speaker.fromMap(map['speakersList'][0]),
    );
  }
}
