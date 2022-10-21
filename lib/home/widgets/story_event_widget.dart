import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/home/providers/story_event_provider.dart';
import 'package:tedx_dtu_app/home/widgets/ted_story_widget.dart';

import '../screens/no_bottombar_screen.dart';
import '../screens/stories_page_view.dart';

class StoryEventWidget extends StatelessWidget {
  const StoryEventWidget({
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    double finalHeight = max(220, height * 0.4);
    final event = Provider.of<StoryEventProvider>(context).findById(id);
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   gradient: LinearGradient(
      //     begin: Alignment.bottomCenter,
      //     end: Alignment.topCenter,
      //     colors: [
      //       Color(0xffe62b1e),
      //       Color(0xffe9401d),
      //       Color(0xffec501d),
      //       Color(0xffee5f1e),
      //       Color(0xfff06c21),
      //     ],
      //   ),
      // ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      height: finalHeight - 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   // margin: const EdgeInsets.only(top: 8.0, bottom: 4, left: 5),
          //   padding: const EdgeInsets.only(
          //       top: 10.0, left: 16, right: 16, bottom: 4),
          //   child: Text(
          //     event.title,
          //
          //   ),
          // ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  // width: 25,
                  width: finalHeight * 0.6,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )),
                  // child: Center(
                  //   child: RotatedBox(
                  //     quarterTurns: 3,
                  //     child: Text(
                  //       event.title,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headline6
                  //           ?.copyWith(color: Colors.white, fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  child: Column(
                    children: [
                      //title
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 16, right: 16, bottom: 4),
                        child: Text(
                          event.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      //description
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 16, right: 16, bottom: 4),
                        child: Text(
                          event.description,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                ...event.stories
                    .map(
                      (e) => TedStoryWidget(
                        leadingText: e.title,
                        dateTime: e.dateTime,
                        imageUrl: e.imageUrl,
                        width: finalHeight * 9 / 16,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            NoBottomBarScreen.routeName,
                            arguments: {
                              'index': e.index,
                              'child': const StoriesPageView(),
                            },
                          );
                        },
                      ),
                    )
                    .toList()
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       top: 16.0, left: 16, right: 16, bottom: 8),
          //   child: Row(
          //     children: [
          //       ConstrainedBox(
          //         constraints: BoxConstraints(
          //           maxWidth: finalHeight * 9 / 16 * 2,
          //         ),
          //         child: Text(
          //           event.description,
          //           style: Theme.of(context)
          //               .textTheme
          //               .headline6
          //               ?.copyWith(color: Colors.white, fontSize: 17),
          //         ),
          //       ),
          //       Container(
          //         color: Colors.yellow,
          //         width: 10,
          //         // height: double.infinity,
          //         child: VerticalDivider(
          //           indent: 0,
          //           endIndent: 0,
          //           color: Colors.white,
          //           width: 3,
          //           thickness: 2,
          //         ),
          //       ),
          //       Text(
          //         event.venue,
          //         style: Theme.of(context)
          //             .textTheme
          //             .headline6
          //             ?.copyWith(color: Colors.white, fontSize: 17),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
