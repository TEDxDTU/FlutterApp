import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/helpers/widgets/blurred_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _currentIndex = 0;
  final _controller = ScrollController();
  var scrollPassed = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.offset > kToolbarHeight) {
        if (!scrollPassed) {
          setState(() {
            scrollPassed = true;
          });
        }
      } else {
        if (scrollPassed) {
          setState(() {
            scrollPassed = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: TedxAppBar(
            scrollPassed: scrollPassed,
          ),
          body: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.grey[800],
            child: SingleChildScrollView(
              controller: _controller,
              child: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: Column(
                  children: [
                    Text('Tab ${_currentIndex + 1}'),
                    SizedBox(
                      height: 1000,
                      width: 300,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              items: [
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.red,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text("Events"),
                  selectedColor: Colors.pink,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
