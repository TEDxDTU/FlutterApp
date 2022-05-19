import 'package:tedx_dtu_app/helpers/constants/constants.dart';

class HttpError implements Exception {
  /// Default constructor, [errorCode] is mandatory.
  ///
  /// [message] is optional, if not provided, is fetched from
  /// [errorMessages]. If no error message is present, defaults to
  /// "Unknown error occured".
  HttpError(this.errorCode, [this.message]) {
    if (message != null) {
      return;
    }
    message = errorMessages[errorCode];
    if (message == null) {
      if (errorCode >= 400 && errorCode <= 499) {
        message = "Some error occured on your end";
      } else if (errorCode > 500) {
        message = "Couldn't get to the server";
      } else {
        message = "Unknown error occured";
      }
    }
  }

  final int errorCode;
  late String? message;
}
