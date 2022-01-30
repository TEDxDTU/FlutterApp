import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class RefreshableFutureScreenTemplate extends StatefulWidget {
  const RefreshableFutureScreenTemplate({
    Key? key,
    required this.body,
    required this.future,
  }) : super(key: key);
  final Widget body;

  final Future<void> Function()? Function([bool]) future;

  @override
  State<RefreshableFutureScreenTemplate> createState() =>
      _RefreshableFutureScreenTemplateState();
}

class _RefreshableFutureScreenTemplateState
    extends State<RefreshableFutureScreenTemplate> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _isLoading = true;
        });
        await widget.future(true)!.call();
        await Future.delayed(Duration(milliseconds: 2000));
        setState(() {
          _isLoading = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          FutureScreenTemplate(
            body: widget.body,
            future: widget.future()?.call(),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(20),
              child: TedxLoadingSpinner(),
            ),
        ],
      ),
    );
  }
}
