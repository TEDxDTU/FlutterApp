import 'dart:convert';

import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:tedx_dtu_app/home/models/story_talk.dart';

class StoryEvent {
  final String id;
  final String title;
  final String description;
  final int storiesStartIndex;
  final int storiesEndIndex;
  final String venue;

  StoryEvent({
    required this.id,
    required this.title,
    required this.description,
    // required this.stories,
    required this.storiesStartIndex,
    required this.storiesEndIndex,
    required this.venue,
  });

  // static List<StoryTalk> _getStoryTalksFromMap(
  //     List<Map<String, dynamic>> storyTalksData, int startIdx) {
  //   final List<StoryTalk> storyTalks = [];
  //   for (int i = 0; i < storyTalksData.length; i++) {
  //     storyTalks.add(StoryTalk.fromMap(storyTalksData[i], startIdx + i));
  //   }
  //   return storyTalks;
  // }

  factory StoryEvent.fromMap(
      Map<String, dynamic> mp, int startIdx, int endIdx) {
    // Map<String, dynamic> mp = json.decode(jsonData);
    return StoryEvent(
      id: mp['_id'],
      title: mp['title'],
      description: mp['details'],
      // stories: _getStoryTalksFromMap(
      storiesStartIndex: startIdx,
      storiesEndIndex: endIdx,
      // stories: _getStoryTalksFromMap(List.from(mp['stories']), startIdx),
      venue: mp['venue'],
    );
  }
}
