import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class FutureScreenTemplate extends StatelessWidget {
  const FutureScreenTemplate({
    Key? key,
    required this.body,
    this.future,
  }) : super(key: key);
  final Widget body;

  final Future? future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: TedxLoadingSpinner(),
          );
        }
        //TODO: ADD ERROR HANDLING
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return body;
      },
    );
  }
}
