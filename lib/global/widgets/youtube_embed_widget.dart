import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// / import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart/';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube_player_iframe/src/player_value.dart';

import '../providers/config.dart';

class YoutubeEmbedWidget extends StatefulWidget {
  const YoutubeEmbedWidget({
    Key? key,
    String? url,
    this.aspectRatio = 16 / 9,
  })  : url = url ?? 'https://www.youtube.com/watch?v=XslI8h7cGDs&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i',
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
        ));

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
        builder: (ctx, val) => Stack(
          alignment: Alignment.center,
          children: [
            YoutubePlayerIFrame(
              aspectRatio: widget.aspectRatio,
              // controller: _controller,
              gestureRecognizers: {},
            ),
            // if (!val.isReady)
            //   Center(
            //     child: CircularProgressIndicator(),
            //   ),
          ],
        ),
      ),
    );
  }
}


// class YoutubeEmbedWidget extends StatefulWidget {
//   final String url;
//   const YoutubeEmbedWidget({
//     Key? key,
//     required this.url,
//   }) : super(key: key);

//   @override
//   State<YoutubeEmbedWidget> createState() => _YoutubeEmbedWidgetState();
// }

// class _YoutubeEmbedWidgetState extends State<YoutubeEmbedWidget> {
//   late final String videoId;
//   late final YoutubePlayerController _controller;
//   YoutubePlayerValue _value = YoutubePlayerValue();
//   @override
//   void initState() {
//     videoId = YoutubePlayer.convertUrlToId(widget.url)!;
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       // params: YoutubePlayerParams(
//       // showControls: false,
//       //   showVideoAnnotations: false,
//       //   useHybridComposition: false,
//       //   showFullscreenButton: true,
//       //   autoPlay: false,
//       //   strictRelatedVideos: true,
//       //   showControls: false,
//       // )
//       flags: YoutubePlayerFlags(
//         hideControls: true,
//         // controlsVisibleAtStart: false,

//         disableDragSeek: true,
//         autoPlay: false,
//         useHybridComposition: false,
//       ),
//     );

//     _controller.addListener(() {
//       setState(() {
//         _value = _controller.value;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // _controller.hidePauseOverlay();
//     // _controller.hideTopMenu();
//     // _controller.
//     final mediaQuery = MediaQuery.of(context);
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//           // aspectRatio: mediaQuery.size.width / mediaQuery.size.height,
//         ),
//         onEnterFullScreen: () {
//           Provider.of<Config>(context, listen: false).hideBottomBar();
//         },
//         onExitFullScreen: () {
//           Provider.of<Config>(context, listen: false).showBottomBar();
//         },
//         builder: (context, player) {
//           // print(_value.position.inSeconds.toDouble());
//           // print(_value.metaData.duration.inSeconds.toDouble());
//           return GestureDetector(
//             onTap: () {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             },
//             child: Stack(
//               children: [
//                 player,
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Slider(
//                     value: _value.position.inSeconds.toDouble(),
//                     activeColor: Theme.of(context).primaryColor,
//                     inactiveColor: Colors.grey,
//                     max: _value.metaData.duration.inSeconds.toDouble(),
//                     onChanged: (pos) {
//                       _controller.seekTo(Duration(seconds: pos.toInt()));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//     //   Widget player = YoutubePlayerIFrame(
//     //     key: ValueKey('player$url'),
//     //     controller: _controller,
//     //   );
//     //   // bool _isInit = true;
//     //   return YoutubeValueBuilder(
//     //       controller: _controller,
//     //       builder: (context, value) {
//     //         // _controller.

//     //         // print(DateTime.now());
//     //         _controller.hidePauseOverlay();
//     //         _controller.hideTopMenu();
//     //         // _isInit = false;
//     //         // _controller.
//     //         // print("value $value");
//     //         return GestureDetector(
//     //           onTap: () {
//     //             print("tap");
//     //             value.playerState == PlayerState.playing
//     //                 ? _controller.pause()
//     //                 : _controller.play();
//     //           },
//     //           child: Stack(
//     //             children: [
//     //               IgnorePointer(
//     //                 ignoring: false,
//     //                 child: player,
//     //               ),
//     //               Positioned(
//     //                 bottom: 0,
//     //                 left: 0,
//     //                 right: 0,
//     //                 child: Slider(
//     //                   value: value.position.inSeconds.toDouble(),
//     //                   activeColor: Theme.of(context).primaryColor,
//     //                   inactiveColor: Colors.grey,
//     //                   max: value.metaData.duration.inSeconds.toDouble(),
//     //                   onChanged: (pos) {
//     //                     _controller.seekTo(Duration(seconds: pos.toInt()));
//     //                   },
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         );
//     //         // : TedxLoadingSpinner();
//     //       });
//     // }
//   }
// }
