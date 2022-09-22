import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../models/bottom_bar_screen.dart';
import '../providers/config.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.currentIndex,
    required this.screens,
    required this.onTap,
  }) : super(key: key);
  final int currentIndex;
  final List<BottomBarScreen> screens;
  final void Function(int) onTap;
  @override
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: min(30, MediaQuery.of(context).size.width * 0.065),
        right: min(30, MediaQuery.of(context).size.width * 0.065),
        child: Consumer<Config>(
          builder: (context, config, child) {
            return config.bottomBarVisible ? child! : SizedBox();
          },
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
              currentIndex: currentIndex,
              // onTap: (i) {
              //   setState(() {
              //     _currentIndex = i;
              //   });
              // },
              onTap: onTap,
              items: screens
                  .map(
                    (e) => SalomonBottomBarItem(
                      icon: Icon(
                        e.icon.icon,
                        size: min(
                            30,
                            (MediaQuery.of(context).size.width * 0.22) /
                                screens.length),
                      ),
                      title: Text(
                        e.title,
                        style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.width * 0.15) /
                              screens.length,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}
