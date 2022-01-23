import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/dummy_data.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({Key? key}) : super(key: key);
  static const routeName = '/events-list';
  @override
  Widget build(BuildContext context) {
    bool isUpcoming = ModalRoute.of(context)?.settings.arguments as bool;

    return BottomBarScreenWidget(
      showTedXLogoInAppBar: false,
      appBarTitle: isUpcoming ? 'Upcoming Events' : 'Past events',
      children: isUpcoming
          ? pastEvents
              .map((event) => SingleEventWidget(
                    eventDate: event.date,
                    eventName: event.title,
                    eventDescription: event.description,
                    imageUrl: event.imageUrl,
                    eventVenue: event.venue,
                    eventId: event.id,
                    isUpcoming: false,
                  ))
              .toList()
          : upcomingEvents
              .map((event) => SingleEventWidget(
                    eventDate: event.date,
                    eventName: event.title,
                    eventDescription: event.description,
                    imageUrl: event.imageUrl,
                    eventVenue: event.venue,
                    eventId: event.id,
                    isUpcoming: true,
                    ticketPrice: event.price,
                  ))
              .toList(),
    );
  }
}
