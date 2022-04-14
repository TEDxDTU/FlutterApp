import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/helpers/grabbing_clipper.dart';
import 'package:tedx_dtu_app/recent_updates/widgets/discover_card.dart';
import '../../recent_updates/models/discover.dart';
import '../../recent_updates/models/recent_update.dart';
import '../../recent_updates/widgets/discover_grabbing.dart';
import '../../recent_updates/widgets/recent_updates_card.dart';

class RecentUpdatesScreen extends StatefulWidget {
  const RecentUpdatesScreen({Key? key}) : super(key: key);
  static const routeName = '/recent-updates-screen';

  @override
  State<RecentUpdatesScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<RecentUpdatesScreen> {
  final grabbingHeight = 40.0;
  late final double discoverCardHeight;
  final double _grabbingVisibleHeight = 32;
  late double _discoverPosition;

  double _initialTouchPos = 0;
  double _currTouchPos = 0;

  final _scrollController = ScrollController();
  final _scrollbarWidth = 60.0;
  final _scrollbarAreaHeight = 16.0;

  var _scrollPosition = 4.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      double convertedOffset = (_scrollController.offset /
              _scrollController.position.maxScrollExtent) *
          _scrollbarWidth;
      setState(() {
        if (_scrollController.offset >= 4 &&
            _scrollController.offset <=
                _scrollController.position.maxScrollExtent) {
          _scrollPosition = convertedOffset;
          if (_scrollPosition < 4) {
            _scrollPosition = 4;
          }
        }
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    discoverCardHeight = MediaQuery.of(context).size.height * 0.35;
    _discoverPosition = -(discoverCardHeight +
        grabbingHeight +
        _scrollbarAreaHeight -
        _grabbingVisibleHeight);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recentUpdate = RecentUpdate(
      'Behind the stage',
      'https://cdn.pixabay.com/photo/2021/09/23/09/42/newspaper-6649286_960_720.jpg',
      'from the last episode a glimpse into how TEDx has becom a...',
      'https://www.ted.com/',
    );
    final discover = Discover(
        imageUrl:
            'https://via.placeholder.com/160x230/00eaff/969696.png?text=Placeholder+Image',
        title: 'Trivia results are now out!');
    final _appBar = AppBar(
      title: const Text('Recent Updates'),
    );
    final mediaQuery = MediaQuery.of(context);
    const _primaryColor = Color(0xffFF0000);
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: _grabbingVisibleHeight),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              const SizedBox(height: 80),
            ],
          ),
          Positioned(
            top: _discoverPosition,
            child: ClipPath(
              clipper: GrabbingClipper(),
              child: Container(
                color: _primaryColor,
                width: mediaQuery.size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: mediaQuery.size.width,
                      height: discoverCardHeight,
                      color: _primaryColor,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          DiscoverCard(discover),
                          DiscoverCard(discover),
                          DiscoverCard(discover),
                          DiscoverCard(discover),
                        ],
                      ),
                    ),
                    Container(
                      width: mediaQuery.size.width,
                      height: _scrollbarAreaHeight,
                      color: _primaryColor,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: _scrollbarWidth,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Color(0xFFB41105),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: _scrollPosition,
                                decoration: const BoxDecoration(
                                  color: Color(0XFFCCCCCC),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        width: mediaQuery.size.width,
                        height: grabbingHeight,
                        child: const DiscoverGrabbing(),
                      ),
                      onVerticalDragUpdate:
                          (DragUpdateDetails dragStartDetails) {
                        _currTouchPos = dragStartDetails.localPosition.dy;
                        double currOffsetVal =
                            (_currTouchPos - _initialTouchPos);
                        if ((currOffsetVal <
                                -(discoverCardHeight +
                                    grabbingHeight +
                                    _scrollbarAreaHeight -
                                    _grabbingVisibleHeight) ||
                            (currOffsetVal > 0))) {
                          return;
                        }
                        setState(() {
                          _discoverPosition = currOffsetVal;
                        });
                      },
                      onVerticalDragStart: (DragStartDetails dragStartDetails) {
                        _initialTouchPos = dragStartDetails.localPosition.dy -
                            _discoverPosition;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
