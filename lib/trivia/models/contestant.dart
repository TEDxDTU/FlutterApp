import 'dart:convert';

class Contestant {
  final String name;
  final int points;
  final double timeTaken;
  final String imageUrl;
  final String university;
  final String firebaseID;
  Contestant({
    required this.name,
    required this.points,
    required this.timeTaken,
    required this.imageUrl,
    required this.university,
    required this.firebaseID,
  });

  factory Contestant.fromMap(Map<String, dynamic> map) {
    return Contestant(
      name: map['name'],
      points: map['points']?.toInt(),
      timeTaken: map['timeTaken']?.toDouble(),
      imageUrl: map['imageURL'],
      university: map['university'],
      firebaseID: map['firebaseID'],
    );
  }
}
