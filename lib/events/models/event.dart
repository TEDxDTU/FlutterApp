import 'package:flutter/cupertino.dart';

import './speaker.dart';

class Event extends ChangeNotifier {
  final String title;
  final String details;
  final String imageUrl;
  final String venue;
  final DateTime date;
  final String id;
  final List<Speaker> speakers;
  Event({
    required this.speakers,
    required this.title,
    required this.details,
    required this.imageUrl,
    required this.venue,
    required this.date,
    required this.id,
  });

  factory Event.fromMap(Map<String, dynamic> map, String id) {
    return Event(
      title: map['themeDetails']['title'],
      details: map['themeDetails']['details'],
      imageUrl: map['themeDetails']['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: id,
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
    );
  }
}

class UpcomingEvent extends Event {
  final int price;
  final bool requiresTicket;
  UpcomingEvent({
    required String title,
    required String details,
    required String imageUrl,
    required String venue,
    required DateTime date,
    required String id,
    required List<Speaker> speakers,
    required this.price,
    required this.requiresTicket,
  }) : super(
          title: title,
          details: details,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
          speakers: speakers,
        );

  factory UpcomingEvent.fromMap(Map<String, dynamic> map, String id) {
    return UpcomingEvent(
      title: map['themeDetails']['title'],
      details: map['themeDetails']['details'],
      imageUrl: map['themeDetails']['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: id,
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
      price: map['price'] ?? 0,
      requiresTicket: map['requiresTicket'],
    );
  }
}

class PastEvent extends Event {
  final List<String> galleryImageUrls;
  final String streamingUrl;
  PastEvent({
    required String title,
    required String details,
    required String imageUrl,
    required String venue,
    required DateTime date,
    required String id,
    required List<Speaker> speakers,
    required this.galleryImageUrls,
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

  factory PastEvent.fromMap(Map<String, dynamic> map, String id) {
    return PastEvent(
      title: map['themeDetails']['title'],
      details: map['themeDetails']['details'],
      imageUrl: map['themeDetails']['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: id,
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
      galleryImageUrls: (map['galleryImageUrls'] as List)
          .map(
            (imageUrl) => imageUrl as String,
          )
          .toList(),
      streamingUrl: map['streamingUrl'],
    );
  }
}
