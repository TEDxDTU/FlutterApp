import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/grabbing_clipper.dart';

class DiscoverGrabbing extends StatelessWidget {
  const DiscoverGrabbing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GrabbingClipper(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: const AutoSizeText(
          'DISCOVER',
          maxFontSize: 18,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
