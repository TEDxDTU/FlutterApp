import 'dart:convert';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:tedx_dtu_app/home/models/story.dart';

class StoryProvider extends ProviderTemplate<Story> {
  @override
  Future<List<Story>> getData() async {
    var response = await http.get(
      Uri.parse(
        nodeServerBaseUrl +
            '/api/events?eventType=story&sortBy=dateTime&sortOrder=asc',
      ),
    );

    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    List<Story> stories = [];
    for (int i = 0; i < data.length; i++) {
      stories.add(Story.fromMap(data[i], i));
    }
    return stories;
  }

  @override
  Story findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

  /// Returns story at particular index. Useful when showing stories in a
  /// PageView.
  Story getStoryAt(int index) {
    return data[index];
  }
}
