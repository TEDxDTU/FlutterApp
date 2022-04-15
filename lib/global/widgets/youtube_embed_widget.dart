import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../providers/config.dart';

class YoutubeEmbedWidget extends StatelessWidget {
  final String url;
  const YoutubeEmbedWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayerController.convertUrlToId(url)!;
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: videoId,
        params: YoutubePlayerParams(
          // showControls: false,
          showVideoAnnotations: false,
          useHybridComposition: false,
          showFullscreenButton: true,
          autoPlay: false,
          strictRelatedVideos: true,
        )
        // flags: YoutubePlayerFlags(
        //     // autoPlay: true,
        //     // mute: true,
        //     ),
        );
    _controller.hidePauseOverlay();
    _controller.hideTopMenu();
    // return YoutubePlayerBuilder(
    //     player: YoutubePlayer(
    //       controller: _controller,
    //     ),
    //     onEnterFullScreen: () {
    //       Provider.of<Config>(context, listen: false).hideBottomBar();
    //     },
    //     onExitFullScreen: () {
    //       Provider.of<Config>(context, listen: false).showBottomBar();
    //     },
    //     builder: (context, player) {
    //       return player;
    //     });
    Widget player = YoutubePlayerIFrame(
      key: ValueKey('player$url'),
      controller: _controller,
    );
    // bool _isInit = true;
    return Stack(
      children: [
        YoutubeValueBuilder(
            controller: _controller,
            builder: (context, value) {
              // _controller.

              print(DateTime.now());
              _controller.hidePauseOverlay();
              _controller.hideTopMenu();
              // _isInit = false;
              // _controller.
              print("value $value");
              return Stack(
                children: [
                  player,
                ],
              );
              // : TedxLoadingSpinner();
            }),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Slider(
            value: _controller.value.position.inSeconds.toDouble(),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
            max: _controller.value.metaData.duration.inSeconds.toDouble(),
            onChanged: (pos) {
              _controller.seekTo(Duration(seconds: pos.toInt()));
            },
          ),
        ),
      ],
    );
  }
}
