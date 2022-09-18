import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/screens/user_tickets_screen.dart';
import 'package:tedx_dtu_app/profile/widgets/profile_options_widget.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, userData, child) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                    .currentInnerWidget = CurrentInnerWidget.mainSettings;
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            userData.user!.name,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            userData.user!.university,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          // const Align(
          //   alignment: Alignment.centerLeft,
          //   child: LabelledWidget(
          //     spacing: 7,
          //     label: 'Mobile',
          //     child: Text(
          //       '9910119645',
          //       style: TextStyle(fontSize: 17),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: LabelledWidget(
              spacing: 7,
              label: 'Email',
              child: Text(
                userData.user!.email,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: ProfileOptionsWidget(
              buttonIcon: Icons.confirmation_num,
              buttonSpecifier: 'Tickets',
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(NoBottomBarScreen.routeName, arguments: {
                  'child': UserTicketsScreen(),
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
                child: const Text('Sign out'),
                onPressed: () {
                  Provider.of<Auth>(context, listen: false).signOut(context);
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
