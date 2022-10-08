import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/screens/events_categories_screen.dart';
import 'package:tedx_dtu_app/events/screens/events_list_screen.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/profile/inner_pages/about_tedxdtu.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/screens/user_tickets_screen.dart';
import 'package:tedx_dtu_app/profile/widgets/profile_options_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var insta = "https://www.instagram.com/tedxdtu/";
  var linkedIn = "https://www.linkedin.com/company/tedxdtu/mycompany/";
  var youtube =
      "https://www.youtube.com/channel/UCZ28umqvK9hX4ygz7bL3Rvw/featured";
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, userData, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              userData.user!.name,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ProfileOptionsWidget(
                      buttonIcon: Icons.person,
                      buttonSpecifier: "Profile",
                      onPressed: () {
                        Provider.of<ProfileInnerWidgetProvider>(context,
                                    listen: false)
                                .currentInnerWidget =
                            CurrentInnerWidget.mainProfile;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProfileOptionsWidget(
                      buttonIcon: Icons.star_border_outlined,
                      buttonSpecifier: "Rate",
                      onPressed: null,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ProfileOptionsWidget(
                      buttonIcon: Icons.confirmation_num,
                      buttonSpecifier: "Tickets",
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(NoBottomBarScreen.routeName, arguments: {
                          'child': UserTicketsScreen(),
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileOptionsWidget(
                      buttonIcon: Icons.description,
                      buttonSpecifier: "About",
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(NoBottomBarScreen.routeName, arguments: {
                          'child': const AboutTedxDtu(),
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFB4B4B4),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                      .pushNamed(EventsListScreen.routeName, arguments: true);
              },
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: const Color(0xFFE9E9E9),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Lottie.asset('assets/lottie/ticket.json'),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffE62B1E)),
                        height: 40,
                        width: 120,
                        child: const Center(
                          child: Text(
                            "Book Tickets",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Join Us On",
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (await canLaunch(insta)) {
                              await launch(
                                insta,
                                universalLinksOnly: true,
                              );
                            } else {
                              throw 'There was a problem to open the url: $insta';
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (await canLaunch(youtube)) {
                              await launch(
                                youtube,
                                universalLinksOnly: true,
                              );
                            } else {
                              throw 'There was a problem to open the url: $youtube';
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.youtube,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (await canLaunch(linkedIn)) {
                              await launch(
                                linkedIn,
                                universalLinksOnly: true,
                              );
                            } else {
                              throw 'There was a problem to open the url: $linkedIn';
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
    ;
  }
}
