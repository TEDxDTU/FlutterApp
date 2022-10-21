import 'dart:convert';

import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:tedx_dtu_app/home/models/story_talk.dart';

class StoryEvent {
  final String id;
  final String title;
  final String description;
  final List<StoryTalk> stories;
  final String venue;

  StoryEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.stories,
    required this.venue,
  });

  static List<StoryTalk> _getStoryTalksFromMap(
      List<Map<String, dynamic>> storyTalksData) {
    final List<StoryTalk> storyTalks = [];
    for (int i = 0; i < storyTalksData.length; i++) {
      storyTalks.add(StoryTalk.fromMap(storyTalksData[i], i));
    }
    return storyTalks;
  }

  factory StoryEvent.fromMap(Map<String, dynamic> mp) {
    // Map<String, dynamic> mp = json.decode(jsonData);
    return StoryEvent(
      id: mp['_id'],
      title: mp['title'],
      description: mp['details'],
      stories: _getStoryTalksFromMap(List.from(mp['stories'])),
      venue: mp['venue'],
    );
  }
}
