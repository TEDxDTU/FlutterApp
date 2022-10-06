import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/widgets/youtube_embed_widget.dart';

class YoutubeEmbedPlayer extends StatefulWidget {
  const YoutubeEmbedPlayer({Key? key}) : super(key: key);

  @override
  State<YoutubeEmbedPlayer> createState() => _YoutubeEmbedPlayerState();
}

class _YoutubeEmbedPlayerState extends State<YoutubeEmbedPlayer> {
  @override
  Widget build(BuildContext context) {
    PastEvent event = Provider.of<Event>(context, listen: true) as PastEvent;

    return YoutubeEmbedWidget(
      url: event.videoUrls[event.currVid],
      key: ValueKey(event.currVid),
    );
  }
}
