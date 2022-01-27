import 'package:flutter/material.dart';

class SelectableBox extends StatelessWidget {
  const SelectableBox({
    required this.name,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String name;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
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
              ),
        ),
      ),
    );
  }
}
