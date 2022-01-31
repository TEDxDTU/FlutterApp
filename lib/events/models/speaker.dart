class Speaker {
  final List<String> achievements;
  final String bio;
  final String imageUrl;
  final String name;
  final String topic;
  final List<String> resources;

  Speaker({
    required this.achievements,
    required this.bio,
    required this.imageUrl,
    required this.name,
    required this.topic,
    required this.resources,
  });

  factory Speaker.fromMap(Map<String, dynamic> map) {
    return Speaker(
      achievements: List<String>.from(map['achievements']),
      bio: map['bio'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      topic: map['topic'],
      resources: List<String>.from(map['resources']),
    );
  }
}
