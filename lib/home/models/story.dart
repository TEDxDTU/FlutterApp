import 'package:tedx_dtu_app/events/models/speaker.dart';

/// A story event is the simplest event, modelled on the Reels from Instagram
/// It consists of a single speaker speaking for 2-3 minutes.
///
class Story {
  /// The unique Id of the story.
  final String id;

  /// The index of the story in the list of stories, set explicitly here for
  /// convenience.
  final int index;

  /// The title of the story
  final String title;

  /// The description of the story
  final String description;

  /// The url to the thumbnail image of the story
  final String imageUrl;

  /// The speaker of the story.
  final Speaker speaker;

  final String streamingUrl;

  /// The date and time the story is occurring.

  // TODO: ADD STREAMING URL
  final DateTime dateTime;
  Story({
    required this.index,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.id,
    required this.speaker,
    required this.dateTime,
    required this.streamingUrl,
  });

  factory Story.fromMap(Map<String, dynamic> map, int index) {
    // print(map);
    return Story(
      index: index,
      title: map['title'],
      description: map['details'],
      imageUrl: map['imageUrl'],
      dateTime: DateTime.parse(map['dateTime']),
      id: map['_id'],
      speaker: Speaker.fromMap(map['speakersList'][0]),
      streamingUrl: map['streamingUrl'],
    );
  }
}
