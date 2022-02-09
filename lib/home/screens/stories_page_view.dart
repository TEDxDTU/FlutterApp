import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/home/screens/single_story_screen.dart';

class StoriesPageView extends StatelessWidget {
  StoriesPageView({Key? key}) : super(key: key);
  static const routeName = '/stories-page-view';
  late final PageController _controller;
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings.arguments);
    int initialPage = (ModalRoute.of(context)?.settings.arguments as int?) ?? 0;

    _controller = PageController(initialPage: initialPage);
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: Provider.of<StoryProvider>(context).length,
      itemBuilder: (context, index) {
        return SingleStoryScreen(
          storyIndex: index,
        );
      },
    );
  }
}
