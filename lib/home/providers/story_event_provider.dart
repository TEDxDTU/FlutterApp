import 'dart:convert';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/home/models/story_talk.dart';

import '../../global/models/http_error.dart';
import '../../helpers/constants/constants.dart';
import '../models/story_event.dart';

import 'package:http/http.dart' as http;

class StoryEventProvider extends ProviderTemplate<StoryEvent> {
  @override
  StoryEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  List<StoryTalk> getEventStories(int startIdx, int endIdx) {
    return _storyTalks.sublist(startIdx, endIdx);
  }

  StoryTalk getStoryAt(int idx) {
    return _storyTalks[idx];
  }

  int get storiesLength {
    return _storyTalks.length;
  }

  List<StoryTalk> _storyTalks = [];

  @override
  Future<List<StoryEvent>> getData() async {
    var response = await http.get(
      Uri.parse(
        nodeServerBaseUrl +
            '/api/events?eventType=storyEvent&sortBy=dateTime&sortOrder=desc',
      ),
    );
    if (response.statusCode >= 400) {
      throw HttpError(response.statusCode);
    }
    // print(response.body);
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    print(data[0]);
    List<StoryEvent> storyEvents = [];
    // List<String>
    // Map<
    int idx = 0;
    for (int i = 0; i < data.length; i++) {
      List<StoryTalk> thisEventStories = [];
      List<Map<String, dynamic>> _storyTalksData =
          List.from(data[i]['stories']);
      int j = 0;
      for (; j < _storyTalksData.length; j++) {
        thisEventStories.add(StoryTalk.fromMap(_storyTalksData[j], idx + j));
      }
      _storyTalks.addAll(thisEventStories);
      StoryEvent event = StoryEvent.fromMap(data[i], idx, idx + j);
      idx += _storyTalksData.length;
      storyEvents.add(event);
    }
    return storyEvents;
    // return data.map((e) => StoryEvent.fromMap(e)).toList();
  }
}
