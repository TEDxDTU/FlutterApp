import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_info.dart';

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
        child: EventInfo(
          eventVenue: 'DTU OAT',
          dateTime: DateTime.now(),
          eventDescription: 'This is the description',
          marginVal: 10,
        ),
      ),
    );
  }
}
