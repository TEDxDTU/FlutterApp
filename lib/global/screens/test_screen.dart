import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
import 'package:intl/intl.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool showSpinner = true;
  String? title;
  late DateTime eventTime;

  @override
  void initState() {
    eventTime = DateTime.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    title = ModalRoute.of(context)?.settings.arguments as String?;
    super.didChangeDependencies();
  }

  var tedxLoadingSpinnerKey = GlobalKey<TedxLoadingSpinnerState>();

  // String time='?';
  // String time=DateFormat('kk:mm,dd-mm-yyyy').format(eventTime);

  Widget createCircularDot(String txt1, String txt2, {double siz: 14}) {
    return Row(
      children: [
        Text(
          txt1,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: siz),
        ),
        SizedBox(width: 7),
        Container(
          width: 3,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 7),
        Text(
          txt2,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: siz),
        ),
      ],
    );
  }

  Widget SingleWidgetEvent() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createCircularDot('Event name 1', '2021', siz: 20),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'data:image/jpeg;base64,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',
                    height: 75,
                    width: 95,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      "Event description",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Event description",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createCircularDot(
                  'Venue',
                  DateFormat('hh:mm a, dd MMM,yyyy').format(eventTime),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Info',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleWidgetEvent(),
          SingleWidgetEvent(),
          SingleWidgetEvent(),
          SingleWidgetEvent(),
          SingleWidgetEvent(),
        ],
      ),
    );
  }
}

/*
appBar: AppBar(title: Text(title ?? 'TEST')),
      body: Center(
        child: FutureBuilder(
            // In future, a future call is to be passed, and must be chained
            // with the awaited translate method present in [TedxLoadingSpinner]
            // for the x in TEDx to fly out of the screen.
            // For just the TEDx logo with x spinning and then disappearing, use
            // this widget like you would use [CircularProgressIndicator].
            future:
                Future.delayed(const Duration(seconds: 5)).then((value) async {
              await tedxLoadingSpinnerKey.currentState!.translate();
              return value;
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return TedxLoadingSpinner(key: tedxLoadingSpinnerKey);
              }
              return const Text('Hey! Sorry for the delay.');
            }),
      ),
      */
