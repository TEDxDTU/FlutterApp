import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/helpers/widgets/expanded_column.dart';
import 'package:tedx_dtu_app/home/screens/tabs_screen.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';

import 'global/models/bottom_bar_screen.dart';
import 'global/widgets/bottom_bar_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primary = const Color(0xffE62B1E);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.black87,
        ),
        primarySwatch: UIHelper.generateMaterialColor(const Color(0xFFE62B1E)),
        primaryColor: const Color(0xFFE62B1E),
        colorScheme: ColorScheme(
          secondary: Colors.grey[800]!,
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
          ),
        ),
        iconTheme: const IconThemeData(color: primary),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: primary, fontSize: 20, fontWeight: FontWeight.w700),
          iconTheme: const IconThemeData(color: primary, size: 45),
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
            borderSide: BorderSide(
              color: primary,
            ),
          ),
          errorStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
      routes: {
        TestScreen.routeName: (context) => const TestScreen(),
      },
      home: TabsScreen(
        screens: [
          // HomeScreen(),
          BottomBarScreen(
            title: 'Home',
            icon: const Icon(Icons.home),
            screen: const HomeScreen(),
          ),
          // BottomBarScreen(
          //   children: [Text('Profile')],
          //   title: 'Profile',
          //   icon: Icon(Icons.account_circle),
          // ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        Text('Home'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(TestScreen.routeName);
          },
          child: Text('PUSH'),
        ),
      ],
    );
  }

  @override
  // TODO: implement children
  List<Widget> get children => throw UnimplementedError();

  @override
  createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  // TODO: implement icon
  Icon get icon => throw UnimplementedError();

  @override
  // TODO: implement physics
  ScrollPhysics get physics => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}
