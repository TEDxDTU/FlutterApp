import 'package:cloud_firestore/cloud_firestore.dart';

class LiveEventInfo {
  LiveEventInfo(this.text, this.textImage);
  String text;
  List<TextImageUrl> textImage;

  factory LiveEventInfo.fromMap(Map<String, dynamic> data) {
    String text = data['text'].toString();
    List<TextImageUrl> textImage = [];
    for (var a in data['textImage'] as List) {
      textImage.add(
        TextImageUrl(a['imageText'].toString(), a['imageUrl'].toString()),
      );
    }
    return LiveEventInfo(text, textImage);
  }

  static Stream<LiveEventInfo> fetch() async* {
    await for (var element in FirebaseFirestore.instance
        .collection('liveEvent')
        .doc('currentInfo')
        .snapshots()) {
      if (element.exists) {
        LiveEventInfo currentInfo = LiveEventInfo.fromMap(element.data()!);
        yield currentInfo;
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
  String text;
  String imageUrl;

  @override
  String toString() {
    return 'text: $text, imageUrl: $imageUrl';
  }
}
