import 'package:flutter/material.dart';

class BottomBarScreen {
  ///String title, displayed in nav bar when selected.
  final String title;

  ///Icon, displayed in nav bar.
  final Icon icon;

  ///The routes for this particular screen. Similar to the routes provided
  ///in main.dart for the app. Routes part of one navigator won't be able to be
  ///accessed from another, unleess added to that one too.
  final Map<String, WidgetBuilder> routes;

  ///The key for this screen's navigator. Must be unique to maintain the
  ///navigation stack.
  final GlobalKey<NavigatorState> navigatorKey;

  ///Creates a BottomBarScreen model. This is passed to TabsScreen to use in
  ///bottom nav bar and display in the main area of the screen.
  ///Each BottomBarScreen also gets its own Navigator, to allow for separate
  ///navigation stacks for each screen in the bottom nav bar.
  BottomBarScreen({
    required this.title,
    required this.icon,
    required this.routes,
    required this.navigatorKey,
  });
}
