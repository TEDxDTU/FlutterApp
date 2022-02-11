import 'package:flutter/material.dart';

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
