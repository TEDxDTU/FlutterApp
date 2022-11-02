import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/tabs_screen.dart';
import 'package:tedx_dtu_app/image_gallery/screens/fullscreen_image_view.dart';
import 'package:tedx_dtu_app/image_gallery/screens/image_gallery_screen.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_in_screen.dart';
import 'package:tedx_dtu_app/ticket-checking/screens/ticket-checking-screen.dart';

import '../../home/screens/home_screen.dart';
import '../../sign_up/screens/sign_up_screen.dart';
import '../models/bottom_bar_screen.dart';
import 'package:tedx_dtu_app/events/screens/event_booking_screen.dart';
import 'package:tedx_dtu_app/events/screens/event_info_screen.dart';
import 'package:tedx_dtu_app/events/screens/events_categories_screen.dart';
import 'package:tedx_dtu_app/events/screens/events_list_screen.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';
import 'package:tedx_dtu_app/home/screens/stories_page_view.dart';
import 'package:tedx_dtu_app/profile/screens/profile_screen.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';
import 'package:tedx_dtu_app/recent_updates/screens/webview_screen.dart';

import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_countdown_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_welcome_screen.dart';

import '../providers/auth.dart';
import 'test_screen.dart';

// This widget needs to be stateful so as to preserve the state of the keys
// through hot reloads. Otherwise the state will be lost and the navigation
// stacks will be cleared.
class TabsRouterScreen extends StatefulWidget {
  const TabsRouterScreen({Key? key}) : super(key: key);

  static const routeName = '/tabs-router-screen';

  @override
  State<TabsRouterScreen> createState() => _TabsRouterScreenState();
}

class _TabsRouterScreenState extends State<TabsRouterScreen> {
  //DO NOT MAKE STATELESS. SEE ABOVE.
  late final GlobalKey<NavigatorState> _homeNavKey =
      GlobalKey<NavigatorState>();
  late final GlobalKey<NavigatorState> _eventsNavKey =
      GlobalKey<NavigatorState>();
  late final GlobalKey<NavigatorState> _profileNavKey =
      GlobalKey<NavigatorState>();
  late final GlobalKey<NavigatorState> _testNavKey =
      GlobalKey<NavigatorState>();
  late final GlobalKey<NavigatorState> _ticketCheckingKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print(_homeNavKey.hashCode);
    print(_eventsNavKey.hashCode);
    print(_profileNavKey.hashCode);
    print(_testNavKey.hashCode);
    return TabsScreen(
      screens: [
        // HomeScreen(),
        BottomBarScreen(
          title: 'Home',
          navigatorKey: _homeNavKey,
          icon: const Icon(Icons.home),
          routes: {
            '/': (context) => const HomeScreen(),
            TestScreen.routeName: (context) => TestScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            EventInfoScreen.routeName: (context) => const EventInfoScreen(),
            StoriesPageView.routeName: (context) => const StoriesPageView(),
            TriviaScreen.routeName: (context) => const TriviaScreen(),
            SpeakerDetailsScreen.routeName: (context) =>
                const SpeakerDetailsScreen(),
            TriviaAttemptScreen.routeName: (context) =>
                const TriviaAttemptScreen(),
            TriviaWelcomeScreen.routeName: (context) =>
                const TriviaWelcomeScreen(),
            TriviaCountdownScreen.routeName: (context) => TriviaCountdownScreen(
                  triviaStr: null,
                ),
            EventsListScreen.routeName: (context) => const EventsListScreen(),
            RecentUpdatesScreen.routeName: (context) =>
                const RecentUpdatesScreen(),
            WebsiteView.routeName: (context) => const WebsiteView(),
            SignInScreen.routeName: (context) => const SignInScreen(),
          },
        ),
        BottomBarScreen(
          title: 'Events',
          navigatorKey: _eventsNavKey,
          icon: const Icon(Icons.calendar_today),
          routes: {
            '/': (context) => const EventsCategoriesScreen(),
            TestScreen.routeName: (context) => const TestScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            EventsListScreen.routeName: (context) => const EventsListScreen(),
            EventInfoScreen.routeName: (context) => const EventInfoScreen(),
            SpeakerDetailsScreen.routeName: (context) =>
                const SpeakerDetailsScreen(),
            EventBookingScreen.routeName: (context) =>
                const EventBookingScreen(),
            ImageGalleryScreen.routeName: (context) =>
                const ImageGalleryScreen(),
            FullscreenImageView.routeName: (context) =>
                const FullscreenImageView(),
          },
        ),
        BottomBarScreen(
          title: 'Profile',
          navigatorKey: _profileNavKey,
          icon: const Icon(Icons.account_circle),
          routes: {
            '/': (context) => const ProfileScreen(),
            TestScreen.routeName: (context) => TestScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            EventsListScreen.routeName: (context) => const EventsListScreen(),
            EventInfoScreen.routeName: (context) => const EventInfoScreen(),
          },
        ),
        // if (Provider.of<Auth>(context).user?.canCheckTickets ?? false)
        //   BottomBarScreen(
        //     title: 'Admin',
        //     icon: Icon(Icons.admin_panel_settings),
        //     routes: {
        //       '/': (context) => const TicketScheckingScreen(),
        //     },
        //     navigatorKey: _ticketCheckingKey,
        //   ),
        // BottomBarScreen(
        //   title: 'blah',
        //   navigatorKey: GlobalKey<NavigatorState>(),
        //   icon: const Icon(Icons.help),
        //   routes: {
        //     '/': (context) => TestScreen(),
        //   },
        // ),
        // BottomBarScreen(
        //   title: 'Test',
        //   navigatorKey: _testNavKey,
        //   icon: const Icon(Icons.help),
        //   routes: {
        //     '/': (context) => TestScreen(),
        //   },
        // ),
      ],
    );
  }
}
