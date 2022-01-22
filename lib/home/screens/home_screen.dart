import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/live_indicator_widget.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';
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
        EventCategoryWidget(
          height: 230,
          // gradientColor: Colors.black,
          title: 'Ted Talk by ...',
          details: const [
            'Theme of the Ted Talk',
            'Description of the Ted Talk',
            'Etc Etc'
          ],
          actionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(TestScreen.routeName);
            },
            child: Text('Join'),
          ),
          trailing: LiveIndicatorWidget(3),
          gradientColor: Theme.of(context).primaryColor,
          fontColor: Colors.white,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              SignUpScreen.routeName,
            );
          },
          child: Text('PUSH TO Sign up'),
        )
        // Text("HELLO"),
        // SizedBox(height: 1000),
        // LiveIndicatorWidget(),
      ],
    );
  }
}
