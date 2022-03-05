import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/live_event.dart';
import 'package:tedx_dtu_app/events/screens/events_list_screen.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

import 'event_info_screen.dart';

class EventsCategoriesScreen extends StatelessWidget {
  const EventsCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        // ignore: prefer_const_constructors
        //TODO: Fetch Live data from firebase
        StreamBuilder(
            stream: LiveEvent.fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data == null) {
                return Center(child: TedxLoadingSpinner());
              }
              print(snapshot.data);
              return EventCategoryWidget(
                title: LiveEvent.instance!.title,
                details: [LiveEvent.instance!.details],
                width: double.infinity,
                actionWidget: Text('Join'),
                showImage: true,
                imageProvider: NetworkImage(
                  LiveEvent.instance!.imageUrl,
                ),
                gradientColor: Colors.red,
                actionWidgetFunction: () {
                  Navigator.of(context)
                      .pushNamed(EventInfoScreen.routeName, arguments: {
                    'eventType': 'live',
                  });
                },
              );
            }),

        EventCategoryWidget(
          title: 'Upcoming Event',
          details: const ['The exciting events we will host in the future'],
          width: double.infinity,
          gradientColor: Colors.white,
          fontColor: Colors.black,
          actionWidget: const Text(
            'View',
            style: TextStyle(color: Colors.black),
          ),
          actionWidgetFunction: () {
            Navigator.of(context)
                .pushNamed(EventsListScreen.routeName, arguments: true);
          },
        ),
        EventCategoryWidget(
          title: 'Past Event',
          details: const [
            'The multitude events that TEDx DTU has hosted in the past'
          ],
          width: double.infinity,
          gradientColor: Colors.black,
          actionWidget: const Text('View'),
          actionWidgetFunction: () {
            Navigator.of(context)
                .pushNamed(EventsListScreen.routeName, arguments: false);
          },
        ),
      ],
    );
  }
}
