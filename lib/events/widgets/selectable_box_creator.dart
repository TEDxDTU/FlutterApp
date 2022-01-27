import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';

class SelectableBoxCreator extends StatefulWidget {
  const SelectableBoxCreator({
    required this.count,
    required this.names,
    Key? key,
  }) : super(key: key);

  final int count;
  final List<String> names;

  @override
  _SelectableBoxCreatorState createState() => _SelectableBoxCreatorState();
}

class _SelectableBoxCreatorState extends State<SelectableBoxCreator> {
  int selectedBox = 0;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widget.count,
          (currNum) {
            return SelectableBox(
              color: selectedBox == currNum
                  ? const Color.fromRGBO(230, 43, 30, 0.5)
                  : Colors.white,
              name: widget.names[currNum],
              onTap: () {
                setState(() {
                  selectedBox = currNum;
                });
              },
            );
          },
          growable: false,
        ),
      ),
    );
  }
}
