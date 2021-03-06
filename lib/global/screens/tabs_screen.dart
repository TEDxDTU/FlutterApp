import 'dart:math';

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tedx_dtu_app/global/models/bottom_bar_screen.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';

import '../widgets/bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    Key? key,
    required this.screens,
  }) : super(key: key);
  final List<BottomBarScreen> screens;
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _currentIndex = 3;

  var scrollPassed = false;
  // final heroController = HeroController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      precacheImage(const AssetImage('assets/images/logoBlack.png'), context);
      precacheImage(const AssetImage('assets/images/logoWhite.png'), context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool val = !(await (widget
                .screens[_currentIndex].navigatorKey.currentState
                ?.maybePop()) ??
            false);
        //False means Navigator popped to the prev screen. True means app will exit.
        print(val);
        if (val && _currentIndex != 0) {
          //If val is true, it means the current navigation stack has nothing to
          //pop to. So we shift the screen back to home page, if the currentIndex
          //is not 0 (which means we're currently not on home page)
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
        return val;
      },
      child: IndexedStack(
        index: _currentIndex,
        children: widget.screens
            .map(
              (e) => Navigator(
                key: e.navigatorKey,
                observers: [HeroController()],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    builder: (context) {
                      if (settings.name == NoBottomBarScreen.routeName) {
                        return NoBottomBarScreen(
                          child: (settings.arguments as Map)['child'] as Widget,
                        );
                      }
                      // print(settings.name);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          (e.routes[settings.name]!(context)),
                          BottomBar(
                            currentIndex: _currentIndex,
                            onTap: (i) {
                              setState(() {
                                _currentIndex = i;
                              });
                            },
                            screens: widget.screens,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
