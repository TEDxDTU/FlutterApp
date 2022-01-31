import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';

class PastEventProvider extends ProviderTemplate<PastEvent> {
  @override
  Future<List<PastEvent>> getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('events')
        .where('eventType', isEqualTo: 'past')
        .orderBy('dateTime', descending: false)
        .get();

    return snapshot.docs.map((e) => PastEvent.fromMap(e.data(), e.id)).toList();
  }

  @override
  PastEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }
}
