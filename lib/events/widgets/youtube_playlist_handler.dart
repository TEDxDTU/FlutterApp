import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/widgets/youtube_single_view.dart';

class YoutubePlaylistHandler extends StatelessWidget {
  const YoutubePlaylistHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var event = Provider.of<Event>(context, listen: false);
    List<dynamic> videoUrls = (event as PastEvent).videoUrls;

    return Column(
      children: [
        ...videoUrls
            .map(
              (url) => Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  YoutubeSingleView(videoUrl: url),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}
