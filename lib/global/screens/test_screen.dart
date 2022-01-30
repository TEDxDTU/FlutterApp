import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('events').snapshots(),
    //   builder: (ctx,
    //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> eventsSnapshot) {
    //     if (eventsSnapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     final eventsData = eventsSnapshot.data!.docs;
    //     return ListView.builder(
    //       itemBuilder: (ctx, index) {
    //         return Text(
    //           eventsData[index].data()['dateTime'].runtimeType.toString(),
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         );
    //       },
    //       itemCount: eventsData.length,
    //     );
    //   },
    // ));
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('push dummy data'),
          onPressed: () async {
            var doc = await FirebaseFirestore.instance
                .collection('events')
                .where('eventType', isNotEqualTo: 'live')
                .get();

            doc.docs.forEach((element) {
              FirebaseFirestore.instance
                  .collection('events')
                  .doc(element.id)
                  .update({
                'currentSpeakerIndex': FieldValue.delete(),
              });
            });
          },
        ),
      ),
    );
  }
}
