import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/discover.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard(this.data, {Key? key}) : super(key: key);
  final Discover data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              data.imageUrl,
            ),
          ),
          AutoSizeText(
            data.title,
            maxFontSize: 18,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
