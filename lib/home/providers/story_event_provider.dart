import 'dart:convert';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';

import '../../global/models/http_error.dart';
import '../../helpers/constants/constants.dart';
import '../models/story_event.dart';

import 'package:http/http.dart' as http;

class StoryEventProvider extends ProviderTemplate<StoryEvent> {
  @override
  StoryEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }

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
    return data.map((e) => StoryEvent.fromMap(e)).toList();
  }
}
