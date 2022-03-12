import 'package:flutter/material.dart';

/// A simple DUMMY Screen that serves as a marker for screens that do not
/// want a bottom bar. Whenever a Screen of this type is pushed, the bottom
/// bar is hidden.
class NoBottomBarScreen extends StatelessWidget {
  const NoBottomBarScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  static const routeName = '/no-bottom-bar-screen';

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return child ?? Container();
  }
}
