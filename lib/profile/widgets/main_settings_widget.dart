import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';

class MainSettingsWidget extends StatelessWidget {
  const MainSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                  .currentInnerWidget = CurrentInnerWidget.mainProfile;
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'MAIN SETTINGS WIDGET',
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
