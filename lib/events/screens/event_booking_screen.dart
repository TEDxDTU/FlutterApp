import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';

class EventBookingScreen extends StatefulWidget {
  const EventBookingScreen({Key? key}) : super(key: key);
  static const routeName = '/event-booking-screen';

  @override
  State<EventBookingScreen> createState() => _EventBookingScreenState();
}

class _EventBookingScreenState extends State<EventBookingScreen> {
  @override
  void didChangeDependencies() {
    for (int i = 1; i <= 8; i++) {
      precacheImage(AssetImage('assets/event_booking/$i.png'), context);
    }
    super.didChangeDependencies();
  }

  var numberOfTickets = 1;
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    String eventTitle = routeArgs['eventTitle'].toString();
    String venue = routeArgs['venue'].toString();
    DateTime dateTime = routeArgs['dateTime'] as DateTime;
    String eventDesc = routeArgs['eventDescription'].toString();
    int ticketPrice = int.parse(routeArgs['eventPrice'].toString());

    var mediaQuery = MediaQuery.of(context);
    var selectableBoxKey = GlobalKey<SelectableBoxCreatorState>();
    var height = max(750, mediaQuery.size.height);

    var appBar = AppBar(
      // TODO: Add style
      title: const Text("Almost There!"),
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height:
                height - appBar.preferredSize.height - mediaQuery.padding.top,
            width: mediaQuery.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: const ConcaveCornersWithRadiusClip(
                        bottomRight: true,
                        bottomLeft: true,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        width: mediaQuery.size.width * 0.9,
                        height: height * 0.25,
                        color: const Color(0xff303030),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: mediaQuery.size.width * 0.9 * 0.5,
                              child: AutoSizeText(
                                eventTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    eventDesc,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AutoSizeText(
                                          DateFormat('dd MMM, yyyy').format(
                                            dateTime,
                                          ),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.calendar_today_outlined,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        AutoSizeText(
                                          DateFormat(
                                                'hh:mm',
                                              ).format(dateTime) +
                                              ' hrs onwards',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.access_time_outlined,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CustomPaint(
                          painter: FilledArcPainter(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: SizedBox(
                        width: 110,
                        child: Image.asset(
                          'assets/images/logoWhite.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: const ConcaveCornersWithRadiusClip(
                        topRight: true,
                        topLeft: true,
                      ),
                      child: Container(
                        // padding: const EdgeInsets.all(24),
                        width: mediaQuery.size.width * 0.9,
                        height: height * 0.55,
                        color: const Color(0xff303030),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TODO: Align image to the bottom
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24.0,
                                left: 24,
                                right: 24,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      venue,
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // height: height * 0.45 * 0.25,
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 8.0,
                                left: 24,
                                right: 24,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            'How many tickets?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Row(
                                            children: List.generate(8, (index) {
                                              return SelectableBox(
                                                name: '${index + 1}',
                                                color: (index + 1 ==
                                                        numberOfTickets)
                                                    ? const Color(0xFFE62B1E)
                                                    : const Color(0xFF5A5A5A),
                                                onTap: () {
                                                  setState(() {
                                                    numberOfTickets = index + 1;
                                                  });
                                                },
                                              );
                                            }, growable: false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Image.asset(
                                        'assets/event_booking/$numberOfTickets.png',
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 8,
                              ),
                              margin: const EdgeInsets.only(top: 8),
                              color: const Color(0xFF404040),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Ticket Price',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: '₹ ',
                                            ),
                                            TextSpan(
                                              text: ticketPrice.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            const TextSpan(
                                              text: ' x ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: numberOfTickets.toString(),
                                              style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                          ),
                                          child: Divider(
                                            thickness: 2,
                                          ),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(text: '₹'),
                                            TextSpan(
                                              text: (ticketPrice *
                                                      numberOfTickets)
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 22,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return const AlertDialog(
                                            title: Text('Cancellation Policy'),
                                            content: Text('Bla bla bla'),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Cancellation Policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Total Payable Amount',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        const Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24.0,
                                            ),
                                            child: Divider(
                                              thickness: 2,
                                            ),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(text: '₹'),
                                              TextSpan(
                                                text: (ticketPrice *
                                                        numberOfTickets)
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      mediaQuery.size.width * 0.9 * 0.9, 40),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Pay ${ticketPrice * numberOfTickets}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                onPressed: () {
                                  print("${selectableBoxKey.currentState}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: mediaQuery.size.width * 0.9 - 24,
                        child: const DottedSeparator(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
