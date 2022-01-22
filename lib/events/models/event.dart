abstract class Event {
  final String title;
  final String description;
  final String imageUrl;
  final String venue;
  final DateTime date;
  final String id;
  Event({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.venue,
    required this.date,
    required this.id,
  });
}

class UpcomingEvent extends Event {
  final double price;
  UpcomingEvent({
    required String title,
    required String description,
    required String imageUrl,
    required String venue,
    required DateTime date,
    required String id,
    required this.price,
  }) : super(
          title: title,
          description: description,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
        );
}

class PastEvent extends Event {
  PastEvent({
    required String title,
    required String description,
    required String imageUrl,
    required String venue,
    required DateTime date,
    required String id,
  }) : super(
          title: title,
          description: description,
          imageUrl: imageUrl,
          venue: venue,
          date: date,
          id: id,
        );
}
