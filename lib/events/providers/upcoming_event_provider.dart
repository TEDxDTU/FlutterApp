import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/helpers/constants/constants.dart';

import '../../global/models/http_error.dart';

class UpcomingEventProvider extends ProviderTemplate<UpcomingEvent> {
  @override
  Future<List<UpcomingEvent>> getData() async {
    var response = await http.get(
      Uri.parse(
        nodeServerBaseUrl +
            '/api/events?eventType=upcoming&sortBy=dateTime&sortOrder=desc',
      ),
    );
    if (response.statusCode >= 400) {
      throw HttpError(response.statusCode);
    }
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    return data
        .map((Map<String, dynamic> e) => UpcomingEvent.fromMap(e))
        .toList();
  }

  @override
  UpcomingEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }
}
