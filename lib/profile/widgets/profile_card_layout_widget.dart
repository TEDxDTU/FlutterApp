import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/inner_pages/change_password_page.dart';
import 'package:tedx_dtu_app/profile/inner_pages/edit_profile_page.dart';
import 'package:tedx_dtu_app/profile/inner_pages/main_profile_page.dart';
import 'package:tedx_dtu_app/profile/inner_pages/main_settings_page.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';

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
              height: max(MediaQuery.of(context).size.height * 0.6, 500),
              width: MediaQuery.of(context).size.width * 0.95,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<ProfileInnerWidgetProvider>(
                  builder: (context, innerWidget, child) {
                    switch (innerWidget.currentInnerWidget) {
                      case CurrentInnerWidget.mainProfile:
                        return const MainProfilePage();
                      case CurrentInnerWidget.mainSettings:
                        return const MainSettingsPage();
                      case CurrentInnerWidget.editProfile:
                        return EditProfilePage();
                      case CurrentInnerWidget.changePassword:
                        return ChangePasswordPage();
                      default:
                        return Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'HELLO',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                    }
                  },
                ),
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
