import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                Container(
                  color: Color(0xffD2D2D2),
                  height: 180,
                ),
                Positioned(
                  // top: 10,
                  right: 0,
                  child: SizedBox(
                    height: 180,
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
                )
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
              height: 180,
            ),
          ),
        )
      ],
    );
  }
}
