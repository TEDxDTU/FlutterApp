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
}
