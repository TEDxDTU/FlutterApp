import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/events/providers/past_event_provider.dart';
import 'package:tedx_dtu_app/events/providers/upcoming_event_provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/tabs_router_screen.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/home/providers/story_provider.dart';
import 'package:tedx_dtu_app/recent_updates/provider/discover_provider.dart';
import 'package:tedx_dtu_app/recent_updates/provider/recent_update_provider.dart';

import 'package:tedx_dtu_app/sign_up/screens/sign_in_screen.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';
import 'package:tedx_dtu_app/trivia/providers/leaderboard_provider.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';

import 'events/widgets/event_info_widget.dart';
import 'firebase_options.dart';
import 'global/models/bottom_bar_screen.dart';
import 'global/providers/config.dart';
import 'global/providers/test_provider.dart';
import 'global/widgets/auto_login_initialiser.dart';
import 'home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("running main");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final globalNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print("myapp building");
    // print(globalNavKey.hashCode);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    const Color primary = Color(0xffE62B1E);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UpcomingEventProvider()),
        ChangeNotifierProvider(create: (_) => PastEventProvider()),
        ChangeNotifierProvider(create: (_) => StoryProvider()),
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => TriviaProvider()),
        ChangeNotifierProvider(create: (_) => LeaderboardProvider()),
        ChangeNotifierProvider(create: (_) => Config()),
        ChangeNotifierProvider(create: (_) => RecentUpdateProvider()),
        ChangeNotifierProvider(create: (_) => DiscoverProvider()),
        ChangeNotifierProvider(create: (_) => TestProvider()),
      ],
      child: MaterialApp(
        navigatorKey: globalNavKey,
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
              primary: Colors.red,
              // onSurface: Colors.red,
              // backgroundColor: Colors.white,
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
              size: 24,
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
        home: const AutoLoginInitializer(),
      ),
    );
  }
}
