import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';

class LiveIndicatorWidget extends StatefulWidget {
  ///Creates an animating live indicator widget that animates arcs
  ///from 1 to [arcNo], then repeat.
  const LiveIndicatorWidget(
    this.arcNo, {
    Key? key,
  }) : super(key: key);

  ///Final number of arcs to animate to.
  final int arcNo;
  @override
  _LiveIndicatorWidgetState createState() => _LiveIndicatorWidgetState();
}

class _LiveIndicatorWidgetState extends State<LiveIndicatorWidget> {
  int currNo = 1;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 700), (timer) {
      setState(() {
        currNo = (currNo + 1) % (widget.arcNo + 1);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('LIVE', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Container(
          alignment: Alignment.center,
          height: widget.arcNo * 10,
          width: widget.arcNo * 10,
          child: CustomPaint(
            painter: LiveIndicatorPainter(currNo),
            child: SizedBox(
              width: currNo * 10,
              height: currNo * 10,
            ),
          ),
        ),
      ],
    );
  }
}
