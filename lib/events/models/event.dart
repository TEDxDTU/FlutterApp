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

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'],
      details: map['details'],
      imageUrl: map['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: map['_id'],
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
  final bool areBookingActive;
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
    required this.areBookingActive,
  }) : super(
          title: title,
          details: details,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
          speakers: speakers,
        );

  factory UpcomingEvent.fromMap(Map<String, dynamic> map) {
    // print(map);
    return UpcomingEvent(
      title: map['title'],
      details: map['details'],
      imageUrl: map['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: map['_id'],
      speakers: (map['speakersList'] as List)
          .map(
            (speaker) => Speaker.fromMap(speaker),
          )
          .toList(),
      price: map['price'] ?? 0,
      requiresTicket: map['requiresTicket'],
      areBookingActive: map['areBookingActive'] ?? false,
    );
  }
}

class PastEvent extends Event {
  final List<String> galleryImageUrls;
  final String? streamingUrl;
  final List<dynamic> videoUrls;
  int _currVid = 0;

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
    required this.videoUrls,
  }) : super(
          title: title,
          details: details,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
          speakers: speakers,
        );

  factory PastEvent.fromMap(Map<String, dynamic> map) {
    return PastEvent(
      title: map['title'],
      details: map['details'],
      imageUrl: map['imageUrl'],
      venue: map['venue'],
      date: DateTime.parse(map['dateTime']),
      id: map['_id'],
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
      videoUrls: map['videoUrls'],
    );
  }

  int get currVid {
    return _currVid;
  }

  void setVid(int index) {
    _currVid = index;
    notifyListeners();
  }

  void nextVid() {
    _currVid++;
    notifyListeners();
  }

  void prevVid() {
    _currVid--;
    notifyListeners();
  }
}
