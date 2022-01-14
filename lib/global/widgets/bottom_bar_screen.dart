import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_sliver_app_bar.dart';

class BottomBarScreen extends StatefulWidget {
  ///Creates a BottomBarScreen.
  ///This widget should be used to create any and all screens that are part of the
  ///bottom navigation bar.
  const BottomBarScreen({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  ///The title for the page. Displayed in the bottom nav bar.
  final String title;

  ///The icon for the page. Displayed in the bottom nav bar.
  final Icon icon;

  ///The widgets that make up the body of the screen.
  ///They are placed in a [Column] wrapped with [SingleChildScrollView]
  ///This is done so that scrolling effects can be uniform across all screens in
  ///bottom navigation bar.
  final List<Widget> children;

  ///The scrolling physics applied to the [SingleChildScrollView] that contains
  ///the [children].
  final ScrollPhysics physics;

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final _controller = ScrollController();
  bool hasScrollPassed = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.offset > kToolbarHeight) {
        setState(() {
          hasScrollPassed = true;
        });
      } else {
        setState(() {
          hasScrollPassed = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TedxAppBar(
        scrollPassed: hasScrollPassed,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // color: Colors.grey[800],
        child: Center(
          child: SingleChildScrollView(
            physics: widget.physics,
            controller: _controller,
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                children: [
                  ...widget.children,
                  const SizedBox(
                    height: kBottomNavigationBarHeight + 50,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
