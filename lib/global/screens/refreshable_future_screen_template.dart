import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';

import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

/// Creates a RefreshableScreenTemplate with a loading spinner
/// Users can pull down to refresh, otherwise data isn't fetched more than once
/// The loading spinner is shown while the data is being fetched
class RefreshableFutureScreenTemplate extends StatefulWidget {
  const RefreshableFutureScreenTemplate({
    Key? key,
    required this.body,
    required this.future,
  }) : super(key: key);

  /// The body that is displayed when the initial or subsequent Futures complete.
  final Widget body;

  /// The Future that is used to fetch the data.
  /// This should be a function, that either returns null, or a another function
  /// that returns a Future. This is to allow for the possibility of a Future
  /// that is already complete (hence null is returned). The bool argument is
  /// for forcing a refresh of the data.
  /// Ideal usage is with [ProviderTemplate]'s fetchData function.
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
        await Future.delayed(const Duration(milliseconds: 2000));
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
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              child: const TedxLoadingSpinner(),
            ),
        ],
      ),
    );
  }
}
