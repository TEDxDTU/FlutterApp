import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/grabbing_clipper.dart';
import '../models/discover.dart';
import 'discover_card.dart';
import 'discover_grabbing.dart';

class DiscoverArea extends StatefulWidget {
  const DiscoverArea({Key? key}) : super(key: key);

  @override
  State<DiscoverArea> createState() => _DiscoverAreaState();
}

class _DiscoverAreaState extends State<DiscoverArea> {
  final grabbingHeight = 40.0;
  late final double discoverCardHeight;
  final double _grabbingVisibleHeight = 32;
  late double _discoverPosition;
  late Timer timer;
  double _initialTouchPos = 0;
  double _currTouchPos = 0;

  final _scrollController = ScrollController();
  final _scrollbarWidth = 60.0;
  final _scrollbarAreaHeight = 16.0;

  var _scrollPosition = 4.0;

  double get discoverAreaHeight => (discoverCardHeight +
      grabbingHeight +
      _scrollbarAreaHeight -
      _grabbingVisibleHeight);
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
    _discoverPosition = -discoverAreaHeight;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    timer.cancel();
    super.dispose();
  }

  int i = 0;
  void animateTo(double finalPosition) {
    double step = (finalPosition - _discoverPosition) / 30;
    i = 0;
    timer = Timer.periodic(Duration.zero, (timer) {
      print(DateTime.now());
      if (i >= 30) {
        timer.cancel();
        return;
      }
      setState(() {
        _discoverPosition += step;
      });
      i++;
    });

    // for (int i = 0; i < 1000; i++) {
    //   print(i);
    //   setState(() {
    //     _discoverPosition += step;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const _primaryColor = Color(0xffFF0000);
    final discover = Discover(
        imageUrl:
            'https://via.placeholder.com/160x230/00eaff/969696.png?text=Placeholder+Image',
        title: 'Trivia results are now out!');
    return Positioned(
      top: _discoverPosition,
      child: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          _currTouchPos = dragUpdateDetails.localPosition.dy;
          double currOffsetVal = (_currTouchPos - _initialTouchPos);
          if ((currOffsetVal < -discoverAreaHeight || (currOffsetVal > 0))) {
            return;
          }
          // print(dragUpdateDetails.delta.dy);
          // dragUpdateDetails.
          // print(currOffsetVal);
          // print(discoverAreaHeight);
          // double? delta = dragUpdateDetails.primaryDelta;
          // if (delta != null &&
          //     delta < 0 &&
          //     currOffsetVal <
          //         -(discoverAreaHeight / 2 + grabbingHeight)) {
          //   setState(() {
          //     _discoverPosition = -discoverAreaHeight;
          //   });
          // } else if (delta != null &&
          //     delta > 0 &&
          //     currOffsetVal >
          //         -(discoverAreaHeight / 2 + grabbingHeight)) {
          //   print("returing ${DateTime.now()}");
          //   setState(() {
          //     _discoverPosition = 0;
          //   });
          // } else {
          // }
          setState(() {
            _discoverPosition = currOffsetVal;
          });
        },
        onVerticalDragStart: (DragStartDetails dragStartDetails) {
          // dragStartDetails.kind==PointerDeviceKind.
          _initialTouchPos =
              dragStartDetails.localPosition.dy - _discoverPosition;
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          // print(dragEndDetails.velocity.pixelsPerSecond.);
          if (_discoverPosition < -(discoverAreaHeight / 2 + grabbingHeight)) {
            animateTo(-discoverAreaHeight);
          } else {
            setState(() {
              animateTo(0);
            });
          }
        },
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
                SizedBox(
                  width: mediaQuery.size.width,
                  height: grabbingHeight,
                  child: const DiscoverGrabbing(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
