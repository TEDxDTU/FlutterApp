import 'package:flutter/material.dart';

/// Global SnackBar Key. Reference added in root level [MaterialApp].
///
/// Use case: Show [SnackBar] anywhere throughout
/// the application without needing the context.
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
