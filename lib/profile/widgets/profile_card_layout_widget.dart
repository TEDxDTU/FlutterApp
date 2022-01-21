import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/main_profile_widget.dart';
import 'package:tedx_dtu_app/profile/widgets/main_settings_widget.dart';

import 'image_upload.dart';

class ProfileCardLayoutWidget extends StatelessWidget {
  const ProfileCardLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Consumer<ProfileInnerWidgetProvider>(
                builder: (context, innerWidget, child) {
                  switch (innerWidget.currentInnerWidget) {
                    case CurrentInnerWidget.mainProfile:
                      return MainProfileWidget();
                    case CurrentInnerWidget.mainSettings:
                      return MainSettingsWidget();
                    default:
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          'HELLO',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
          Positioned(
            top: -40,
            child: ImageUpload(onSelectImage: (_) {}),
          ),
        ],
      ),
    );
  }
}
