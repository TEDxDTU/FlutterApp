import 'dart:convert';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:tedx_dtu_app/home/models/story_talk.dart';

import '../../global/models/http_error.dart';

class StoryProvider extends ProviderTemplate<StoryTalk> {
  @override
  Future<List<StoryTalk>> getData() async {
    var response = await http.get(
      Uri.parse(
        nodeServerBaseUrl +
            '/api/events?eventType=story&sortBy=dateTime&sortOrder=asc',
      ),
    );

    if (response.statusCode >= 400) {
      throw HttpError(response.statusCode);
    }
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    List<StoryTalk> stories = [];
    for (int i = 0; i < data.length; i++) {
      stories.add(StoryTalk.fromMap(data[i], i));
    }
    return stories;
  }

  @override
  StoryTalk findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  /// Returns story at particular index. Useful when showing stories in a
  /// PageView.
  StoryTalk getStoryAt(int index) {
    return data[index];
  }
}
