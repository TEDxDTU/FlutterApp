import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleEventWidget(
            eventDate: DateTime.now(),
            eventDescription:
                'Description\nDescription asdfkjahksdfhj kajh\n sdfk jashdkfjhaksfkjashdkfjhsakdfjhkajsdfhkajshdfkjashdfkjhaskdfjhsakdfjhksajhfkjdjsfhk jsa',
            // eventDescription: 'hello',
            eventId: '1',
            eventName: 'Event Name',
            eventVenue: 'Venue',
            imageUrl: 'https://picsum.photos/id/1/200/300',
            isUpcoming: false,
          ),
          SingleEventWidget(
            eventDate: DateTime.now(),
            eventDescription: 'Description\nDescription',
            eventId: '1',
            eventName: 'Event 2',
            eventVenue: 'Venue2',
            imageUrl: 'https://picsum.photos/id/1/200/300',
            isUpcoming: true,
            ticketPrice: 100,
          ),
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
