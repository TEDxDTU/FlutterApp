import 'dart:convert';

import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:http/http.dart' as http;

class LiveEvent extends Event {
  /// The current live even being streamed
  static late LiveEvent instance;

  final bool requiresTicket;
  final String streamingUrl;
  final int currentSpeakerIndex;
  final String? currDataToDisplay;
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
    required this.currentSpeakerIndex,
    this.currDataToDisplay,
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
      id: 'LIVEEVENT',
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
      requiresTicket: map['requiresTicket'],
      currentSpeakerIndex: map['currentSpeakerIndex'],
      currDataToDisplay: map['currDataToDisplay'],
    );
  }

  /// Fetches the current live event from the server
  static Future<LiveEvent> fetch() async {
    var response = await http.get(
      Uri.parse(
        // Anyone using this paste your own IPv4 address here
        'http://192.168.1.37:3000/api/liveEvent',
      ),
    );
    Map<String, dynamic> data = json.decode(response.body);
    instance = LiveEvent._fromMap(data);
    return instance;
  }
}
