import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/profile_card_layout_widget.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
        ..textTheme
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            )
            .copyWith(
              bodyText2: const TextStyle(
                color: Colors.black,
              ),
            ),
      child: Provider.of<Auth>(context).isAuth
          ? ChangeNotifierProvider(
              create: (context) => ProfileInnerWidgetProvider(),
              builder: (context, child) {
                return BottomBarScreenWidget(
                  showTedXLogoInAppBar: false,
                  appBarTitle: Provider.of<ProfileInnerWidgetProvider>(context)
                      .appBarTitle,
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    ProfileCardLayoutWidget(),
                  ],
                );
              },
            )
          : const Scaffold(
              body: Center(
                child: AnonProfileScreen(),
              ),
            ),
    );
  }
}

class AnonProfileScreen extends StatelessWidget {
  const AnonProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height * 0.4, 400),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Lottie.asset("assets/lottie/sign_in.json"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please Sign in to view your Profile",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // visualDensity: VisualDensity.compact,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                ),
                onPressed: () {
                  Provider.of<Auth>(context, listen: false).signOut(context);
                },
                child: const Text('Sign In'),
              ),
            ]),
          ),
        ));
  }
}
