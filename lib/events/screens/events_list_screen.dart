import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/dummy_data.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({Key? key}) : super(key: key);
  static const routeName = '/events-list';
  @override
  Widget build(BuildContext context) {
    bool isUpcoming = ModalRoute.of(context)?.settings.arguments as bool;

    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('events')
            .where('eventType', isEqualTo: isUpcoming ? 'upcoming' : 'past')
            .orderBy('dateTime', descending: !isUpcoming)
            .get(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: TedxLoadingSpinner());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return BottomBarScreenWidget(
            showTedXLogoInAppBar: false,
            appBarTitle: isUpcoming ? 'Upcoming Events' : 'Past events',
            children: snapshot.data!.docs.map((e) {
              Map<String, dynamic> event = e.data();
              return SingleEventWidget(
                eventId: e.id,
                eventName: event['themeDetails']['title'],
                eventDate: DateTime.parse(event['dateTime']),
                imageUrl: event['themeDetails']['imageUrl'],
                eventDescription: event['themeDetails']['details'],
                eventVenue: event['venue'],
                isUpcoming: isUpcoming,
                ticketPrice: (event['price'] ?? 0).toDouble(),
              );
            }).toList(),
          );
        });
  }
}
