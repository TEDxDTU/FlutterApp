import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UpcomingTedTalks extends StatelessWidget {
  const UpcomingTedTalks({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Ted Talks',
                  style: Theme.of(context).textTheme.headline6),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: IconButton(
                    color: Colors.black,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                    ),
                    onPressed: () {
                      print('Add navigation to new screen.');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: children,
          ),
        )
      ]),
    );
  }
}
