import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';

class BottomBarScreenWidget extends StatefulWidget {
  /// Creates a BottomBarScreenWidget.
  /// This widget should be used to create any and all screens that are part of the
  /// bottom navigation bar. It is RECOMMENDED, but not NECESSARY for all other
  /// screens. If you have a screen that has a complicated structure involving
  /// stacks or other such widgets, you should create your own [Scaffold] and
  /// continue from there. Example - [SpeakerDetailsScreen]
  const BottomBarScreenWidget({
    Key? key,
    required this.children,
    this.physics = const BouncingScrollPhysics(),
    this.showTedXLogoInAppBar = true,
    this.appBarTitle,
  }) : super(key: key);

  ///The widgets that make up the body of the screen.
  ///They are placed in a [Column] wrapped with [SingleChildScrollView]
  ///This is done so that scrolling effects can be uniform across all screens in
  ///bottom navigation bar.
  final List<Widget> children;

  ///The scrolling physics applied to the [SingleChildScrollView] that contains
  ///the [children].
  final ScrollPhysics physics;

  /// Whether app bar should show TEDxDTU logo
  final bool showTedXLogoInAppBar;

  /// The title for the app bar.
  final String? appBarTitle;

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreenWidget> {
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
        showTedxLogo: widget.showTedXLogoInAppBar,
        title: widget.appBarTitle,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // color: Colors.grey[800],
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
    );
  }
}
