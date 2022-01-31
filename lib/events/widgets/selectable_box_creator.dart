import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';

/// Creates a [Row] of [SelectableBox]s with given [names]
/// [count] determines the number of available boxes.
///
/// Exposes its state [SelectableBoxCreatorState] to make use of the information
/// of the current box selected and change the parent widget accordingly.
///
/// Use [ValueListenableBuilder] in conjunction to change the parent widget
/// accordingly.
///
/// Throws an assert when [count] is not equal to [names.length].
class SelectableBoxCreator extends StatefulWidget {
  const SelectableBoxCreator({
    required this.count,
    required this.names,
    Key? key,
  })  : assert(count == names.length, "count must be equal to number of names"),
        super(key: key);

  /// The number of boxes to build.
  final int count;

  /// Titles of all the boxes.
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
