import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                  .currentInnerWidget = CurrentInnerWidget.mainSettings;
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'MAIN PROFILE WIDGET',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
