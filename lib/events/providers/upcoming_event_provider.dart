import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';

class UpcomingEventProvider extends ProviderTemplate<UpcomingEvent> {
  @override
  Future<List<UpcomingEvent>> getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('events')
        .where('eventType', isEqualTo: 'upcoming')
        .orderBy('dateTime', descending: true)
        .get();

    return snapshot.docs
        .map((e) => UpcomingEvent.fromMap(e.data(), e.id))
        .toList();
  }

  @override
  UpcomingEvent findById(String id) {
    return data.firstWhere((element) => element.id == id);
  }
}
