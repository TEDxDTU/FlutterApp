class RecentUpdate {
  RecentUpdate(this.title, this.imageUrl, this.description, this.url);

  /// TO IMPLEMENT!
  factory RecentUpdate.fromMap(Map<String, dynamic> data) {
    // TODO: Implement fromMap function
    // This is the expected implementation of the
    // fromMap function don't depend on it.
    try {
      return RecentUpdate(
        data['title'],
        data['imageUrl'],
        data['description'],
        data['url'],
      );
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  String title;
  String? imageUrl;
  String description;
  String url;
}
