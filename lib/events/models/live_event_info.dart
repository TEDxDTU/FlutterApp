import 'package:cloud_firestore/cloud_firestore.dart';

class LiveEventInfo {
  LiveEventInfo(this.text, this.textImage, this.link);
  String? text;
  List<TextImageUrl> textImage;
  String? link;

  factory LiveEventInfo.fromMap(Map<String, dynamic> data) {
    String? text = data['text'];
    String? link = data['link'];
    List<TextImageUrl> textImage = [];
    if (data['textImage'] != null) {
      for (var a in data['textImage'] as List) {
        textImage.add(
          TextImageUrl(
            a['imageText'],
            a['imageUrl'],
          ),
        );
      }
    }
    return LiveEventInfo(text, textImage, link);
  }

  static Stream<LiveEventInfo> fetch() async* {
    await for (var element in FirebaseFirestore.instance
        .collection('liveEvent')
        .doc('currentInfo')
        .snapshots()) {
      if (element.exists) {
        LiveEventInfo currentInfo = LiveEventInfo.fromMap(element.data()!);
        if (currentInfo.text == null &&
            currentInfo.textImage.isEmpty &&
            currentInfo.link == null) {
        } else {
          yield currentInfo;
        }
      }
    }
  }

  @override
  String toString() {
    return 'text: $text, textImage: $textImage';
  }
}

class TextImageUrl {
  TextImageUrl(this.text, this.imageUrl);
  String? text;
  String? imageUrl;

  @override
  String toString() {
    return 'text: $text, imageUrl: $imageUrl';
  }
}
