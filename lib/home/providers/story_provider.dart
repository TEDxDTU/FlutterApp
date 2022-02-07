import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/home/models/story.dart';

class StoryProvider extends ProviderTemplate<Story> {
  @override
  Future<List<Story>> getData() async {
    var response = await http.get(
      Uri.parse(
        // Anyone using this paste your own IPv4 address here
        'http://192.168.1.37:3000/api/events?eventType=story&sortBy=dateTime&sortOrder=asc',
      ),
    );

    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));

    return data.map((Map<String, dynamic> e) => Story.fromMap(e)).toList();
  }

  @override
  Story findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }
}
