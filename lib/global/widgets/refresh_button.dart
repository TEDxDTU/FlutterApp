import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Future<void> Function() onPressed;

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await widget.onPressed();
        setState(() {
          isLoading = false;
        });
      },
      icon: isLoading ? CircularProgressIndicator() : Icon(Icons.refresh),
    );
  }
}
