import 'dart:convert';

import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:http/http.dart' as http;

class LiveEvent extends Event {
  final bool requiresTicket;
  final String streamingUrl;
  LiveEvent._({
    required String title,
    required String details,
    required String imageUrl,
    required String venue,
    required DateTime date,
    required String id,
    required List<Speaker> speakers,
    required this.requiresTicket,
    required this.streamingUrl,
  }) : super(
          title: title,
          details: details,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
          speakers: speakers,
        );

  factory LiveEvent._fromMap(Map<String, dynamic> map) {
    // print(map);
    return LiveEvent._(
      title: map['title'],
      details: map['details'],
      imageUrl: map['imageUrl'],
      venue: map['venue'],
      streamingUrl: map['streamingUrl'],
      date: DateTime.parse(map['dateTime']),
      id: map['_id'],
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
      requiresTicket: map['requiresTicket'],
    );
  }
  static Future<LiveEvent> fetch() async {
    var response = await http.get(
      Uri.parse(
        // Anyone using this paste your own IPv4 address here
        'http://192.168.1.37:3000/api/liveEvent',
      ),
    );
    Map<String, dynamic> data = json.decode(response.body);
    return LiveEvent._fromMap(data);
  }
}
