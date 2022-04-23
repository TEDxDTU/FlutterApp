class Discover {
  Discover({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.url,
  });
  factory Discover.fromMap(Map<String, dynamic> data) {
    // Expected implementation below
    return Discover(
      id: data['_id'] as String,
      title: data['title'] as String,
      imageUrl: data['imageURL'] as String,
      url: data['URL'] as String,
    );
  }
  final String id;
  final String title;
  final String imageUrl;
  final String url;
}
