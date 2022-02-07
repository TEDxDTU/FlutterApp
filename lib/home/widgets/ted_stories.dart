import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/home/models/story.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/home/screens/single_story_screen.dart';
import 'package:tedx_dtu_app/home/widgets/ted_story_widget.dart';

class TedStories extends StatefulWidget {
  const TedStories({
    double? scrollBarWidth,
    Key? key,
    this.preWidgets,
    this.postWidgets,
  })  : scrollBarWidth = scrollBarWidth ?? 120,
        super(key: key);

  final double scrollBarWidth;
  final List<Widget>? preWidgets;
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TEDxDTU Stories',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                      ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: IconButton(
                      color: Colors.black,
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                      ),
                      onPressed: () {
                        print('Add navigation to new screen.');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshableFutureScreenTemplate(
              future: Provider.of<StoryProvider>(context).fetchData,
              body: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...widget.preWidgets ?? [],
                  ...Provider.of<StoryProvider>(context)
                      .data
                      .map(
                        (e) => TedStoryWidget(
                          leadingText: e.title,
                          dateTime: e.dateTime,
                          imageProvider: NetworkImage(e.imageUrl),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              SingleStoryScreen.routeName,
                              arguments: e.id,
                            );
                          },
                        ),
                      )
                      .toList(),
                  ...widget.postWidgets ?? [],
                ],
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
              ),
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
