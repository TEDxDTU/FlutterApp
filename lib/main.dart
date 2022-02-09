import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/providers/past_event_provider.dart';
import 'package:tedx_dtu_app/events/providers/upcoming_event_provider.dart';
import 'package:tedx_dtu_app/events/screens/event_booking_screen.dart';
import 'package:tedx_dtu_app/events/screens/event_info_screen.dart';
import 'package:tedx_dtu_app/events/screens/events_categories_screen.dart';
import 'package:tedx_dtu_app/events/screens/events_list_screen.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/home/screens/single_story_screen.dart';
import 'package:tedx_dtu_app/profile/screens/profile_screen.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/home/screens/tabs_screen.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';

import 'events/widgets/event_info_widget.dart';
import 'global/models/bottom_bar_screen.dart';
import 'home/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xffE62B1E);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UpcomingEventProvider()),
        ChangeNotifierProvider(create: (_) => PastEventProvider()),
        ChangeNotifierProvider(create: (_) => StoryProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          toggleableActiveColor: primary,
          scaffoldBackgroundColor: Colors.black,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),

          // canvasColor: Colors.red[100],
          snackBarTheme: SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.black87,
          ),
          primarySwatch:
              UIHelper.generateMaterialColor(const Color(0xFFE62B1E)),
          primaryColor: const Color(0xFFE62B1E),
          colorScheme: ColorScheme(
            secondary: Colors.grey[600]!,
            primary: primary,
            background: Colors.black,
            onBackground: Colors.white,
            brightness: Brightness.dark,
            error: Colors.red[800]!,
            onError: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.white,
            surface: Colors.red,
            secondaryVariant: Colors.black,
            primaryVariant: Colors.red[700]!,
          ),
          cardTheme: CardTheme(
            color: const Color(0xffE62B1E),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const StadiumBorder(),
              primary: Colors.black,
              side: const BorderSide(
                color: Colors.black,
                width: 1.3,
              ),
              onSurface: Colors.red,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white,
              onSurface: Colors.red,
              backgroundColor: Colors.red,
            ),
          ),
          iconTheme: const IconThemeData(color: primary),
          appBarTheme: const AppBarTheme(
            // centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,

            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),

            iconTheme: IconThemeData(
              color: Colors.white,
              size: 45,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              // borderSide: BorderSide.none,
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),

            border: OutlineInputBorder(
              gapPadding: 5,
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 5,
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: primary,
              ),
            ),
            errorStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.all(0),
          ),
          textTheme: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .copyWith(
                headline1: const TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                ),
                subtitle1: TextStyle(
                  color: Colors.grey[600],
                ),
                bodyText2: const TextStyle(
                  color: Colors.black,
                ),
              ),
          popupMenuTheme: PopupMenuThemeData(
            // color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
        ),
        routes: {
          TestScreen.routeName: (context) => TestScreen(),
        },
        home: TabsScreen(
          screens: [
            // HomeScreen(),
            BottomBarScreen(
              title: 'Home',
              navigatorKey: GlobalKey<NavigatorState>(),
              icon: const Icon(Icons.home),
              routes: {
                '/': (context) => const HomeScreen(),
                TestScreen.routeName: (context) => TestScreen(),
                SignUpScreen.routeName: (context) => const SignUpScreen(),
                EventInfoScreen.routeName: (context) => const EventInfoScreen(),
                SingleStoryScreen.routeName: (context) =>
                    const SingleStoryScreen(),
              },
            ),
            BottomBarScreen(
              title: 'Events',
              navigatorKey: GlobalKey<NavigatorState>(),
              icon: const Icon(Icons.calendar_today),
              routes: {
                '/': (context) => const EventsCategoriesScreen(),
                TestScreen.routeName: (context) => TestScreen(),
                SignUpScreen.routeName: (context) => const SignUpScreen(),
                EventsListScreen.routeName: (context) =>
                    const EventsListScreen(),
                EventInfoScreen.routeName: (context) => const EventInfoScreen(),
                SpeakerDetailsScreen.routeName: (context) =>
                    const SpeakerDetailsScreen(),
                EventBookingScreen.routeName: (context) =>
                    const EventBookingScreen(),
              },
            ),
            BottomBarScreen(
              title: 'Profile',
              navigatorKey: GlobalKey<NavigatorState>(),
              icon: const Icon(Icons.account_circle),
              routes: {
                '/': (context) => const ProfileScreen(),
                TestScreen.routeName: (context) => TestScreen(),
                SignUpScreen.routeName: (context) => const SignUpScreen(),
              },
            ),
            BottomBarScreen(
              title: 'Test',
              navigatorKey: GlobalKey<NavigatorState>(),
              icon: const Icon(Icons.help),
              routes: {
                '/': (context) => TestScreen(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
