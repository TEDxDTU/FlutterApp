import 'package:flutter/material.dart';

class UpcomingTedTalks extends StatefulWidget {
  const UpcomingTedTalks({
    required this.children,
    double? scrollBarWidth,
    Key? key,
  })  : scrollBarWidth = scrollBarWidth ?? 120,
        super(key: key);

  final List<Widget> children;
  final double scrollBarWidth;

  @override
  State<UpcomingTedTalks> createState() => _UpcomingTedTalksState();
}

class _UpcomingTedTalksState extends State<UpcomingTedTalks> {
  final _scrollController = ScrollController();

  //TODO: Fix this static initial value
  double _scrollPosition = 20;

  @override
  void initState() {
    _scrollController.addListener(() {
      double convertedOffset = (_scrollController.offset /
              _scrollController.position.maxScrollExtent) *
          widget.scrollBarWidth;
      setState(() {
        if (_scrollController.offset >= 20 &&
            _scrollController.offset <=
                _scrollController.position.maxScrollExtent) {
          _scrollPosition = convertedOffset;
          if (_scrollPosition < 20) {
            _scrollPosition = 20;
          }
        }
      });
    });
    super.initState();
  }

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
            children: widget.children,
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: widget.scrollBarWidth,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: _scrollPosition,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
