import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_booking_screen_footer.dart';

import '../widgets/event_booking_screen_header.dart';

class EventBookingScreen extends StatelessWidget {
  const EventBookingScreen({Key? key}) : super(key: key);
  static const routeName = '/event-booking-screen';

  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 8; i++) {
      precacheImage(AssetImage('assets/event_booking/$i.png'), context);
    }
    var routeArgs =
        (ModalRoute.of(context)?.settings.arguments as Map<String, Object>?) ??
            {
              'eventTitle': 'The TEDxDTU App',
              'eventDescription':
                  'The TEDxDTU App is a mobile app that allows you to book tickets for TEDxDTU events. You can also view the event schedule and register for events.',
              'venue': 'DTU',
              'dateTime': DateTime.now(),
              'eventPrice': '100',
            };
    String eventTitle = routeArgs['eventTitle'].toString();
    String venue = routeArgs['venue'].toString();
    DateTime dateTime = routeArgs['dateTime'] as DateTime;
    String eventDesc = routeArgs['eventDescription'].toString();
    String eventId = routeArgs['eventId'].toString();
    int ticketPrice = int.parse(routeArgs['eventPrice'].toString());
    // _isInit = false;
    var mediaQuery = MediaQuery.of(context);
    // var selectableBoxKey = GlobalKey<SelectableBoxCreatorState>();
    var height = max(750, mediaQuery.size.height);

    var appBar = AppBar(
      title: const Text("Almost There!"),
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height:
                height - appBar.preferredSize.height - mediaQuery.padding.top,
            width: mediaQuery.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EventBookingScreenHeader(
                  width: mediaQuery.size.width * 0.9,
                  height: height,
                  eventTitle: eventTitle,
                  eventDesc: eventDesc,
                  dateTime: dateTime,
                ),
                EventBookingScreenFooter(
                  ticketPrice: ticketPrice,
                  venue: venue,
                  eventName: eventTitle,
                  eventId: eventId,
                  eventDesc: eventDesc,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
