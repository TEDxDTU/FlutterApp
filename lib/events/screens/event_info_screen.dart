import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:tedx_dtu_app/events/providers/past_event_provider.dart';
import 'package:tedx_dtu_app/events/providers/upcoming_event_provider.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/event_info.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/events/widgets/speaker_info_widget.dart';

/// Creates an EventInfoScreen.
///
/// [routeName] = '/event-info-screen'
///
/// Shows Speaker Info, Event Info and Gallery.
///
/// This screen receives routeArguments as a [Map<String, Object>].
class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';

  List<Widget> _getSpeakerInfoWidgets(List<Speaker> speakers) {
    final List<Widget> widgets = [];
    for (int i = 0; i < speakers.length; i++) {
      widgets.add(SpeakerInfoWidget(
        imageUrl: speakers[i].imageUrl,
        personalStats: speakers[i].achievements,
        speakerIndex: i,
        speakerName: speakers[i].name,
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
      EventInfo(
        eventVenue: e.venue,
        dateTime: e.date,
        eventDescription: e.details,
        marginVal: 8,
      ),
      if (e is PastEvent)
        Column(
          children: (e).galleryImageUrls.map((e) => Image.network(e)).toList(),
        )
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
                      count: 3,
                      names: const [
                        'Speaker info',
                        'Event info',
                        'Gallery',
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
                    color: Colors.black,
                    child: ValueListenableBuilder(
                      valueListenable:
                          selectableBoxKey.currentState!.selectedBox,
                      builder: (context, value, _) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(8.0).copyWith(bottom: 100),
                            child: bottomWidgets[selectableBoxKey
                                .currentState!.selectedBox.value],
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
