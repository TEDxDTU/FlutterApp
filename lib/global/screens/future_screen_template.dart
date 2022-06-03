import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/models/http_error.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class FutureScreenTemplate extends StatelessWidget {
  /// Creates a FutureScreenTemplate that waits for a future to complete,
  /// and then shows the final [body]. A loading spinner is shown while waiting.
  /// Error handling to be added.
  const FutureScreenTemplate({
    Key? key,
    required this.body,
    this.future,
  }) : super(key: key);

  /// The body to display when the future is complete.
  final Widget body;

  /// The future to wait for.
  final Future? future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: TedxLoadingSpinner(),
          );
        }
        if (snapshot.hasError) {
          String errorMessage = "";
          if (snapshot.error is HttpError) {
            errorMessage = (snapshot.error as HttpError).message!;
          }
          return Scaffold(
            body: Center(
              child: SelectableText(
                'Error: $errorMessage',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return body;
      },
    );
  }
}
