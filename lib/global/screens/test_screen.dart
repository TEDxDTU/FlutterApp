import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_info_widget.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('events').snapshots(),
      builder: (ctx,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> eventsSnapshot) {
        if (eventsSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final eventsData = eventsSnapshot.data!.docs;
        return Scaffold(
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              // debugPrint(json.encode(eventsData[index].data()) + ',');
              return SelectableText(
                json.encode(eventsData[index].data()) + ',',
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            },
            itemCount: eventsData.length,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection(('data'))
                  .doc('events')
                  .set({
                'events': json.encode(eventsData.map((e) => e.data()).toList()),
              });
            },
          ),
        );
      },
    );
  }
}
