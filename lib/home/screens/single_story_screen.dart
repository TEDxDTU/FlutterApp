import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/helpers/widgets/blurred_widget.dart';
import 'package:tedx_dtu_app/home/models/story_talk.dart';
import 'package:tedx_dtu_app/home/providers/story_event_provider.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';

import '../../global/widgets/custom_image_widget.dart';
import '../../global/widgets/youtube_embed_widget.dart';

/// Displays a full screen view of the story's details
/// NO BOTTOM BAR should be present in this.
class SingleStoryScreen extends StatelessWidget {
  const SingleStoryScreen({
    Key? key,
    required this.storyIndex,
  }) : super(key: key);

  /// The index of the story to display, as provided by the [StoryEventProvider].
  final int storyIndex;

  @override
  Widget build(BuildContext context) {
    StoryTalk story =
        Provider.of<StoryEventProvider>(context).getStoryAt(storyIndex);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      // : Theme.of(context),
      textStyle: Theme.of(context).textTheme.bodyText1,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            // TODO:Replace with YT Embed
            Positioned.fill(
              //Replace with YT embed
              // child: CustomImageWidget(
              //   url: story.imageUrl,
              //   fit: BoxFit.cover,
              // ),
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(
                  bottom: height * min(0.15, 150 / height),
                  top: MediaQuery.of(context).padding.top,
                ),
                child: YoutubeEmbedWidget(
                  url: story.streamingUrl,
                  aspectRatio: width /
                      (height -
                          MediaQuery.of(context).padding.top -
                          height * min(0.15, 150 / height)),
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                child: Material(
                  color: Colors.black54,
                  shape: CircleBorder(),
                  child: ClipOval(
                    child: BlurredWidget(
                      sigmaX: 10,
                      sigmaY: 10,
                      child: InkWell(
                        radius: 40,
                        customBorder: CircleBorder(),
                        // splashColor: Colors.red,

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Story info
            DraggableScrollableSheet(
              initialChildSize: 0.31,
              minChildSize: min(0.15, 150 / height),
              maxChildSize: 0.7,
              snapSizes: [min(0.3, 180 / height), 0.61, 0.7],
              // expand: false,
              snap: true,
              builder: (_, controller) {
                return BlurredWidget(
                  sigmaX: 3,
                  sigmaY: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.black45,
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   topRight: Radius.circular(20),
                      // ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black38,
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                    ),
                    // padding: const EdgeInsets.all(10),
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.all(15),
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        // SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              DateFormat('dd MMMM, yyyy').format(
                                story.dateTime,
                              ),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          story.description,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: CustomImageWidget(
                                url: story.speaker.imageUrl,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    story.speaker.name,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    story.speaker.bio,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ...story.speaker.achievements
                            .map((e) => Text(
                                  "• " + e,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
