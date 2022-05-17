import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget(
      {Key? key,
      required this.dateTime,
      required this.personPerTicket,
      required this.tedTalkLocation,
      required this.tedTopic,
      required this.tedSpeaker})
      : super(key: key);
  // late String dateTime;
  // late String time;
  final DateTime dateTime;
  final int personPerTicket;
  final String tedSpeaker;
  final String tedTopic;
  final String tedTalkLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: ClipPath(
            clipper: const ConcaveCornersWithRadiusClip(
              topRight: true,
              bottomRight: true,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: const Color(0xffD2D2D2),
                  height: 180,
                ),
                const Positioned(
                  // top: 10,
                  right: 0,
                  child: SizedBox(
                    height: 180,
                    child: DottedSeparator(
                      axis: Axis.vertical,
                      backgroundColor: Color(0xffBDBDBD),

                      // lineColor: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CustomPaint(
                    painter: FilledArcPainter(
                      fillColor: Color(0xffC7C7C7),
                      arcWidth: 12,
                    ),
                    size: Size(70, 70),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 60, 10),
                  height: 150,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tedSpeaker,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        tedTopic,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              tedTalkLocation,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ClipPath(
            clipper: const ConcaveCornersWithRadiusClip(
              topLeft: true,
              bottomLeft: true,
            ),
            child: Container(
              color: const Color(0xff555555),
              height: 180,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              DateFormat('dd MMM, yy').format(
                                dateTime,
                              ),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              DateFormat('hh:mm a').format(dateTime),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        constraints: BoxConstraints.loose(const Size(60, 28)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color(0xFF6E6E6E),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              personPerTicket.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.account_circle,
                              size: 20.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
