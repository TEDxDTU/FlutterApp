import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_sliver_app_bar.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({
    Key? key,
    required this.title,
    required this.slivers,
    required this.shouldGoBack,
    this.showDefaultAppBar = true,
    this.physics = const BouncingScrollPhysics(),
    this.showFloatingActionButton = false, // If you set this to true
    this.floatingActionButton,
    this.scaffoldColor = Colors.black,
  })  : assert(!showFloatingActionButton || floatingActionButton != null),
        super(key: key);

  final String title;
  final List<Widget> slivers;
  final bool shouldGoBack;

  final bool showDefaultAppBar;
  final ScrollPhysics physics;
  final bool showFloatingActionButton;
  final Widget? floatingActionButton;
  final Color scaffoldColor;

  @override
  _ScreenTemplateState createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
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
      floatingActionButton: (widget.showFloatingActionButton)
          ? widget.floatingActionButton
          : null,
      body: CustomScrollView(
        slivers: [
          TedXSliverAppBar(),
          ...(widget.slivers),
        ],
      ),
    );
  }
}
