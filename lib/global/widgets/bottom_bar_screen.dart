import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_sliver_app_bar.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({
    Key? key,
    required this.title,
    required this.children,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  final String title;
  final List<Widget> children;

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
            controller: _controller,
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                children: widget.children,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
