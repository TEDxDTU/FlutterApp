import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
    required this.razorpayOrderID,
    required this.eventName,
    required this.venue,
    required this.date,
    required this.noOfTickets,
  }) : super(key: key);
  final String razorpayOrderID;
  final String eventName;
  final String venue;

  final DateTime date;
  final int noOfTickets;

  Widget iconedText(Icon icon, String data, String? bottomData, Color textColor,
      [bool bold = false, bool spaceAround = false]) {
    return Row(
      mainAxisSize: spaceAround ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          spaceAround ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 5),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data,
                style: TextStyle(
                  color: textColor,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  // fontStyle: FontStyle.bold,
                ),
              ),
              if (bottomData != null)
                Text(
                  bottomData,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                    // fontStyle: FontStyle.bold,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // IntrinsicHeight()
              Expanded(
                flex: 5,
                child: ClipPath(
                  clipper: ConcaveCornersWithRadiusClip(
                    topRight: true,
                    bottomRight: true,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Container(
                          color: Color(0xffD2D2D2),
                          // height: 180,
                        ),
                      ),
                      Positioned(
                        // top: 10,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: SizedBox(
                          // height: 180,
                          child: DottedSeparator(
                            axis: Axis.vertical,
                            backgroundColor: Color(0xffD2D2D2),

                            // lineColor: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CustomPaint(
                          painter: FilledArcPainter(
                            fillColor: Color(0xffBDBDBD),
                            arcWidth: 12,
                          ),
                          size: Size(70, 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: ConcaveCornersWithRadiusClip(
                    topLeft: true,
                    bottomLeft: true,
                  ),
                  child: Container(
                    color: Color(0xff555555),
                    // height: 180,
                    padding: const EdgeInsets.all(7),
                    // child:
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                // color: Color(0xffD2D2D2),
                // height: 180,
                padding: const EdgeInsets.all(5),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        eventName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.yellow,
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QrImage(
                              data: razorpayOrderID,
                              size: min(
                                  MediaQuery.of(context).size.width * 0.27,
                                  140)),
                        ],
                      ),
                    ),
                    iconedText(
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      venue,
                      null,
                      Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconedText(
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      DateFormat('dd MMM').format(date),
                      date.year.toString(),
                      Colors.white,
                      true,
                      true,
                    ),
                    SizedBox(height: 15),
                    iconedText(
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                      ),
                      DateFormat('hh:mm ').format(date),
                      'onwards',
                      Colors.white,
                      false,
                      true,
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff6F6F6F),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 5),
                          Text(
                            noOfTickets.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/images/logoWhite.png',
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

/*  Container(
                    // color: Color(0xffD2D2D2),
                    // height: 180,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            eventName +
                                "asldjfhkajsdasdkfjhakjsdhfkjahsdkjfhaksdhfkajhdskjfahkdsjhfhkfjahkdfjhakjds",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.yellow,
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QrImage(
                                  data: razorpayOrderID,
                                  size: min(
                                      MediaQuery.of(context).size.width * 0.27,
                                      140)),
                              Flexible(
                                child: iconedText(
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                  ),
                                  venue,
                                  null,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),*/

/* Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconedText(
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      DateFormat('dd MMM').format(date),
                      date.year.toString(),
                      Colors.white,
                      true,
                      true,
                    ),
                    SizedBox(height: 15),
                    iconedText(
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                      ),
                      DateFormat('hh:mm ').format(date),
                      'onwards',
                      Colors.white,
                      false,
                      true,
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff6F6F6F),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 5),
                          Text(
                            noOfTickets.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    )
                  ],
                ),*/