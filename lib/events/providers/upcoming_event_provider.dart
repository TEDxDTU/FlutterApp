import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:http/http.dart' as http;

class UpcomingEventProvider extends ProviderTemplate<UpcomingEvent> {
  @override
  Future<List<UpcomingEvent>> getData() async {
    var response = await http.get(
      Uri.parse(
        // Anyone using this paste your own IPv4 address here
        'http://192.168.1.37:3000/api/events?eventType=upcoming&sortBy=dateTime&sortOrder=desc',
      ),
    );
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    return data
        .map((Map<String, dynamic> e) => UpcomingEvent.fromMap(e))
        .toList();

    // return snapshot.docs
    //     .map((e) => UpcomingEvent.fromMap(e.data(), e.id))
    //     .toList();
  }

  @override
  UpcomingEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }
}