import 'package:flutter/material.dart';

/// Creates a squircle selectable box with a given [color], primary content is
/// [name], executes [onTap] on tapping (used here to set the state in
/// [SelectableBoxCreator]).
class SelectableBox extends StatelessWidget {
  const SelectableBox({
    required this.name,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// The color of the box.
  final Color color;

  /// The text shown inside the box.
  final String name;

  /// Function executed on tapping.
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          color: color,
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: color == Colors.white ? Colors.black : Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
