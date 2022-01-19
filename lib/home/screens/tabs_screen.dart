import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tedx_dtu_app/global/models/bottom_bar_screen.dart';

import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

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
  var _currentIndex = 0;

  var scrollPassed = false;

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
      child: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: widget.screens
                .map(
                  (e) => Navigator(
                    key: e.navigatorKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        settings: settings,
                        builder: (context) => e.routes[settings.name]!(context),
                      );
                    },
                  ),
                )
                .toList(),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SalomonBottomBar(
                unselectedItemColor: Colors.black,
                currentIndex: _currentIndex,
                onTap: (i) {
                  setState(() {
                    _currentIndex = i;
                  });
                },
                items: widget.screens
                    .map((e) => SalomonBottomBarItem(
                          icon: e.icon,
                          title: Text(e.title),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
