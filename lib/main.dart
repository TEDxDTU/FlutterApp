import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';

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
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white12,
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
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          // fillColor: const Color(0xFFffffff),

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Card(
              child: SizedBox(
                height: 200,
                width: 200,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
            TextButton(onPressed: () {}, child: Text('TextButton')),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
            TextField(
              enabled: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
