import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/models/speaker.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

import '../../global/widgets/custom_image_widget.dart';

/// Creates a widget which shows a rounded image of speaker along with name and
/// some stats.
///
/// Takes [speakerName], [personalStats] and [imageUrl] as required arguments.
///
/// Optional [loadingIndicator] and [width].
class SpeakerInfoWidget extends StatefulWidget {
  const SpeakerInfoWidget({
    double? width,
    Key? key,
    required this.speakerIndex,
    this.loadingIndicator,
    this.isCurrent = false,
  })  : width = width ?? 300,
        super(key: key);

  final int speakerIndex;

  /// A custom loading indicator, if not provided, default one is used.
  final Widget? loadingIndicator;

  /// The width of the widget.
  ///
  /// Defaults to 300.
  final double width;

  final bool isCurrent;

  @override
  State<SpeakerInfoWidget> createState() => _SpeakerInfoWidgetState();
}

class _SpeakerInfoWidgetState extends State<SpeakerInfoWidget> {
  Timer? timer;
  bool _switched = false;
  @override
  void initState() {
    if (widget.isCurrent) {
      timer = Timer.periodic(Duration(seconds: 1, milliseconds: 500), (timer) {
        setState(() {
          _switched = !_switched;
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Speaker speaker = Provider.of<Event>(context).speakers[widget.speakerIndex];
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SpeakerDetailsScreen.routeName,
          arguments: {
            'name': speaker.name,
            'imageUrl': speaker.imageUrl,
            'achievements': speaker.achievements,
            'bio': speaker.bio,
            'topic': speaker.topic,
            'resources': speaker.resources,
          },
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        width: widget.width,
        // height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: _switched ? Color(0xff82ff90) : Colors.white,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widget.width / 3,
              height: widget.width / 3,
              child: Hero(
                tag: speaker.imageUrl,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: CustomImageWidget(
                    url: speaker.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        speaker.name,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ...speaker.achievements
                        .sublist(0, 2)
                        .map(
                          (stat) => Text(
                            stat,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
