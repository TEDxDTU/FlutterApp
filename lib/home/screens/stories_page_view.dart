import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/home/providers/story_event_provider.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/home/screens/single_story_screen.dart';

/// Creates a scrollable list of stories, similar to Instagram reels
/// Takes the initial index of the story to be displayed as a parameter through
/// [ModalRoute]
class StoriesPageView extends StatelessWidget {
  const StoriesPageView({Key? key}) : super(key: key);
  static const routeName = '/stories-page-view';

  @override
  Widget build(BuildContext context) {
    int initialPage = ((ModalRoute.of(context)?.settings.arguments
            as Map)['index'] as int?) ??
        0;

    final PageController _controller = PageController(initialPage: initialPage);
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: Provider.of<StoryEventProvider>(context).storiesLength,
      itemBuilder: (context, index) {
        return SingleStoryScreen(
          storyIndex: index,
        );
      },
    );
  }
}
