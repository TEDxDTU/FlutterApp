import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube_player_iframe/src/player_value.dart';

import '../providers/config.dart';

class YoutubeEmbedWidget extends StatefulWidget {
  const YoutubeEmbedWidget({
    Key? key,
    String? url,
    this.aspectRatio = 16 / 9,
  })  : url = url ??
            'https://www.youtube.com/watch?v=XslI8h7cGDs&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i',
        super(key: key);
  final String url;
  final double aspectRatio;

  @override
  State<YoutubeEmbedWidget> createState() => _YoutubeEmbedWidgetState();
}

class _YoutubeEmbedWidgetState extends State<YoutubeEmbedWidget> {
  late YoutubePlayerController _controller;
  late String id;
  YoutubePlayerValue value = YoutubePlayerValue();

  @override
  void initState() {
    id = YoutubePlayerController.convertUrlToId(widget.url)!;
    print("id $id");
    _controller = YoutubePlayerController(
      initialVideoId: id,
      params: const YoutubePlayerParams(
        autoPlay: false,
        strictRelatedVideos: true,
        privacyEnhanced: true,
        enableJavaScript: false,
        enableKeyboard: false,
        useHybridComposition: false,
        showFullscreenButton: true,
      ),
    );

    /// THE CONTROLLER NEVER UPDATES, BUG IN PACKAGE
    print("1");
    _controller.listen((newVal) {
      print("1.5");
      setState(() {
        value = newVal;
      });
    });
    print("2");
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("ready ${value.isReady}");
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: YoutubeValueBuilder(
        buildWhen: (prev, curr) {
          print("when ${DateTime.now()}");
          return prev.isReady != curr.isReady;
        },
        builder: (ctx, val) {
          return YoutubePlayerIFrame(
            aspectRatio: widget.aspectRatio,
            // controller: _controller,
            gestureRecognizers: {},
          );
        },
      ),
    );
  }
}
