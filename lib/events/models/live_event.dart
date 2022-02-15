import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:http/http.dart' as http;

class LiveEvent extends Event {
  /// The current live even being streamed
  static LiveEvent? instance;

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
    try {
      LiveEvent e = LiveEvent._(
        title: map['title'],
        details: map['details'],
        imageUrl: map['imageUrl'],
        venue: map['venue'],
        streamingUrl: map['streamingUrl'],
        date: DateTime.parse(map['dateTime']),
        id: 'LIVEEVENT',
        speakers: (map['speakers'] as List)
            .map(
              (speaker) => Speaker.fromMap(speaker),
            )
            .toList(),
        requiresTicket: map['requiresTicket'] == 'true',
        currentSpeakerIndex: map['currentSpeakerIndex'],
        currDataToDisplay: map['currentDataToDisplay'],
      );
      print(e.title);
      return e;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Fetches the current live event from the server
  static Stream<LiveEvent?> fetch() async* {
    await for (var element
        in FirebaseFirestore.instance.collection('liveEvent').snapshots()) {
      if (element.docs.isNotEmpty) {
        print(element.docs.first.data());
        instance = LiveEvent._fromMap(element.docs.first.data());

        print('yielded');
        yield instance;
      }
    }
  }
}
