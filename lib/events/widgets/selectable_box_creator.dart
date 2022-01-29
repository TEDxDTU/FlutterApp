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
  SelectableBoxCreatorState createState() => SelectableBoxCreatorState();
}

class SelectableBoxCreatorState extends State<SelectableBoxCreator> {
  var selectedBox = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widget.count,
          (currNum) {
            return SelectableBox(
              color: selectedBox.value == currNum
                  ? const Color.fromRGBO(230, 43, 30, 0.5)
                  : Colors.white,
              name: widget.names[currNum],
              onTap: () {
                setState(() {
                  selectedBox.value = currNum;
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
