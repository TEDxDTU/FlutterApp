import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/events/widgets/speaker_info_widget.dart';

class EventInfoScreen extends StatefulWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';

  @override
  State<EventInfoScreen> createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    var mediaQuery = MediaQuery.of(context);
    final String speakerName = routeArgs['speakerName'].toString();
    final List<String> speakerDetails =
        routeArgs['speakerInfo'] as List<String>;
    final String imageUrl = routeArgs['imageUrl'].toString();
    final String eventName = routeArgs['eventName'].toString();

    var selectableBoxKey = GlobalKey<SelectableBoxCreatorState>();

    List<Widget> bottomWidgets = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
        ],
      ),
      Column(
        children: const [
          Text(
            'This is the event info',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      Column(
        children: const [
          Text(
            'Idhar aayegi humari gallery',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(eventName),
      ),
      body: SizedBox(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: Stack(
          children: [
            Column(
              children: [
                EventCategoryWidget(
                  title: 'A sooper interesting TED Talk!',
                  details: [],
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
              initialChildSize:
                  mediaQuery.orientation == Orientation.portrait ? 0.61 : 0.58,
              minChildSize:
                  mediaQuery.orientation == Orientation.portrait ? 0.61 : 0.58,
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
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: bottomWidgets[selectableBoxKey
                                .currentState!.selectedBox.value],
                          ),
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
