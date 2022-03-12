import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/concave_corners_with_radius_clip.dart';
import '../helpers/filled_arc_painter.dart';

class EventBookingScreenHeader extends StatelessWidget {
  const EventBookingScreenHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.eventTitle,
    required this.eventDesc,
    required this.dateTime,
  }) : super(key: key);

  final double width;
  final num height;
  final String eventTitle;
  final String eventDesc;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: const ConcaveCornersWithRadiusClip(
            bottomRight: true,
            bottomLeft: true,
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            // width: mediaQuery.size.width * 0.9,
            width: width,
            height: height * 0.25,
            color: const Color(0xff303030),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: AutoSizeText(
                    eventTitle,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AutoSizeText(
                          eventDesc,
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
    );
  }
}
