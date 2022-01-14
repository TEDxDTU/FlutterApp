import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/event_widget.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        Text('Home'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(TestScreen.routeName);
          },
          child: Text('PUSH'),
        ),
        EventWidget(
          gradientColor: Colors.black,
          title: 'EVENT',
          details: ['DETAILS'],
          trailing: CustomPaint(
            painter: LiveIndicatorPainter(),
          ),
        ),
        Text("HELLO"),
        // SizedBox(height: 1000),
        CustomPaint(
          painter: LiveIndicatorPainter(),
          size: Size(100, 100),
        ),
      ],
    );
  }
}
