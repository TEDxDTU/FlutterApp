import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/home/models/story.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/home/screens/home_screen.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/home/screens/single_story_screen.dart';
import 'package:tedx_dtu_app/home/screens/stories_page_view.dart';
import 'package:tedx_dtu_app/home/widgets/ted_story_widget.dart';

/// The TED Stories widget, to be displayed on top in the [HomeScreen].
/// Displays a List of [Story] objects, using the [TedStoryWidget]. Data is
/// provided by [StoryProvider].
class TedStories extends StatefulWidget {
  const TedStories({
    double? scrollBarWidth,
    Key? key,
    this.preWidgets,
    this.postWidgets,
  })  : scrollBarWidth = scrollBarWidth ?? 120,
        super(key: key);

  /// The width of the scrollbar, in pixels.
  final double scrollBarWidth;

  /// The list of Widgets to show ,if any, before the stories.
  final List<Widget>? preWidgets;

  /// The list of Widgets to show ,if any, after the stories.
  final List<Widget>? postWidgets;

  @override
  State<TedStories> createState() => _TedStoriesState();
}

class _TedStoriesState extends State<TedStories> {
  final _scrollController = ScrollController();

  double _scrollPosition = 20;

  @override
  void initState() {
    _scrollController.addListener(() {
      double convertedOffset = (_scrollController.offset /
              _scrollController.position.maxScrollExtent) *
          widget.scrollBarWidth;
      setState(() {
        if (_scrollController.offset >= 20 &&
            _scrollController.offset <=
                _scrollController.position.maxScrollExtent) {
          _scrollPosition = convertedOffset;
          if (_scrollPosition < 20) {
            _scrollPosition = 20;
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    double finalHeight = max(220, height * 0.4);
    return SizedBox(
      height: finalHeight,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 8),
              child: Text(
                'TEDxDTU Stories',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<StoryProvider>(context, listen: false)
                  .fetchData(false)
                  ?.call(),
              builder: ((context, snapshot) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...widget.preWidgets ?? [],
                    ...Provider.of<StoryProvider>(context)
                        .data
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
                        .toList(),
                    ...widget.postWidgets ?? [],
                  ],
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: widget.scrollBarWidth,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: _scrollPosition,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
