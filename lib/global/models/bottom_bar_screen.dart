import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class BottomBarScreen {
  ///String title, displayed in nav bar when selected.
  final String title;

  ///Icon, displayed in nav bar.
  final Icon icon;

  ///Widget(Screen, should preferably be a [BottomBarScreenWidget]) that is
  ///shown in the main area of the app when the item is selected.
  final Widget screen;

  ///Creates a BottomBarScreen model. This is passed to TabsScreen to use in
  ///bottom nav bar and display in the main area of the screen.
  BottomBarScreen({
    required this.title,
    required this.icon,
    required this.screen,
  });
}
