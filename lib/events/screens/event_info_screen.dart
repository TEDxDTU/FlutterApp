import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:tedx_dtu_app/events/providers/past_event_provider.dart';
import 'package:tedx_dtu_app/events/providers/upcoming_event_provider.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/event_info_widget.dart';
import 'package:tedx_dtu_app/events/widgets/past_event_gallery.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/events/widgets/speaker_info_widget.dart';

/// Creates an EventInfoScreen.
///
/// [routeName] = '/event-info-screen'
///
/// Shows Speaker Info, Event Info and Gallery.
///
/// This screen receives routeArguments as a [Map<String, String>].
class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';

  List<Widget> _getSpeakerInfoWidgets(List<Speaker> speakers) {
    final List<Widget> widgets = [];
    for (int i = 0; i < speakers.length; i++) {
      widgets.add(SpeakerInfoWidget(
        speakerIndex: i,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // An instance of [MediaQueryData] to make the screen responsive.
    var mediaQuery = MediaQuery.of(context);

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // Get the event from the provider.
    final eventId = routeArgs['eventId']!;
    final eventType = routeArgs['eventType'];

    Event e;

    if (eventType == 'upcoming') {
      e = Provider.of<UpcomingEventProvider>(context).findById(eventId);
    } else {
      e = Provider.of<PastEventProvider>(context).findById(eventId);
    }

    // A global key to switch between Speaker Info, Event Info and Gallery
    // as requested by user.
    var selectableBoxKey = GlobalKey<SelectableBoxCreatorState>();

    // List of widgets shown in the DraggableScrollableSheet.
    List<Widget> bottomWidgets = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getSpeakerInfoWidgets(e.speakers),
      ),
      EventInfoWidget(
        eventVenue: e.venue,
        dateTime: e.date,
        eventDescription: e.details,
        eventTitle: e.title,
        eventPrice: (e is UpcomingEvent) ? e.price : 0,
        marginVal: 8,
      ),
      if (e is PastEvent) PastEventGallery(e.galleryImageUrls),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(e.title),
      ),
      body: SizedBox(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: ChangeNotifierProvider<Event>.value(
          value: e,
          child: Stack(
            children: [
              Column(
                children: [
                  //TODO: Replace with YT embed
                  EventCategoryWidget(
                    title: e.title,
                    details: [
                      e.details,
                    ],
                    width: double.infinity,
                    height: mediaQuery.size.height * 0.25,
                    showActionWidget: false,
                  ),
                  Container(
                    width: double.infinity,
                    height: mediaQuery.size.height * 0.08,
                    alignment: Alignment.centerLeft,
                    child: SelectableBoxCreator(
                      key: selectableBoxKey,
                      count: (e is PastEvent) ? 3 : 2,
                      names: [
                        'Speaker info',
                        'Event info',
                        if (e is PastEvent) 'Gallery',
                      ],
                    ),
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: mediaQuery.orientation == Orientation.portrait
                    ? 0.61
                    : 0.58,
                minChildSize: mediaQuery.orientation == Orientation.portrait
                    ? 0.61
                    : 0.58,
                maxChildSize: 1.0,
                snap: true,
                builder: (context, scrollController) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      left: 2,
                      right: 2,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff0f0f0f),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(0, -1),
                            blurRadius: 7,
                            // spreadRadius: 1,
                          ),
                        ]),
                    child: ValueListenableBuilder(
                      valueListenable:
                          selectableBoxKey.currentState!.selectedBox,
                      builder: (context, value, _) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0)
                                .copyWith(bottom: 100, top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.0),
                                    child: SizedBox(
                                      width: 24,
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                bottomWidgets[selectableBoxKey
                                    .currentState!.selectedBox.value],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
