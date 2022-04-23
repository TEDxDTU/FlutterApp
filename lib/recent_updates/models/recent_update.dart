class RecentUpdate {
  RecentUpdate({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  /// TO IMPLEMENT!
  factory RecentUpdate.fromMap(Map<String, dynamic> data) {
    // TODO: Implement fromMap function
    // This is the expected implementation of the
    // fromMap function don't depend on it.
    try {
      return RecentUpdate(
        id: data["_id"],
        title: data['title'],
        imageUrl: data['imageURL'],
        description: data['description'],
        url: data['URL'],
      );
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
  final String id;
  final String title;
  final String? imageUrl;
  final String description;
  final String url;
}
