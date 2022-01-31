import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/providers/past_event_provider.dart';
import 'package:tedx_dtu_app/events/providers/upcoming_event_provider.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({Key? key}) : super(key: key);
  static const routeName = '/events-list';
  @override
  Widget build(BuildContext context) {
    bool isUpcoming = ModalRoute.of(context)?.settings.arguments as bool;
    ProviderTemplate provider = isUpcoming
        ? Provider.of<UpcomingEventProvider>(context) as ProviderTemplate
        : Provider.of<PastEventProvider>(context);

    return RefreshableFutureScreenTemplate(
      future: provider.fetchData,
      body: BottomBarScreenWidget(
        showTedXLogoInAppBar: false,
        appBarTitle: isUpcoming ? 'Upcoming Events' : 'Past Events',
        children: provider.data
            .map((e) => SingleEventWidget(
                  eventDate: e.date,
                  eventDescription: e.details,
                  eventId: e.id,
                  eventName: e.title,
                  eventVenue: e.venue,
                  imageUrl: e.imageUrl,
                  isUpcoming: isUpcoming,
                  ticketPrice: isUpcoming ? e.price : null,
                ))
            .toList(),
      ),
    );
  }
}
