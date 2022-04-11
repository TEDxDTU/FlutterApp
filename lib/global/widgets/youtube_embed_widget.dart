import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../providers/config.dart';

class YoutubeEmbedWidget extends StatelessWidget {
  final String url;
  const YoutubeEmbedWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(url)!;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
          // autoPlay: true,
          // mute: true,
          ),
    );

    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        onEnterFullScreen: () {
          Provider.of<Config>(context, listen: false).hideBottomBar();
        },
        onExitFullScreen: () {
          Provider.of<Config>(context, listen: false).showBottomBar();
        },
        builder: (context, player) {
          return player;
        });
  }
}
