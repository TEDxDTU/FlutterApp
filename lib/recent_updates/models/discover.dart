class Discover {
  Discover({
    required this.title,
    required this.imageUrl,
  });
  factory Discover.fromMap(Map<String, Object> data) {
    throw UnimplementedError();
    // Expected implementation below
    return Discover(
      title: data['title'] as String,
      imageUrl: data['imageUrl'] as String,
    );
  }
  String title;
  String imageUrl;
}
