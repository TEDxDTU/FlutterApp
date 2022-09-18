import 'package:tedx_dtu_app/global/providers/provider_template.dart';

import '../models/http_error.dart';

class TestProvider extends ProviderTemplate {
  @override
  findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getData() {
    // In actual use cases, Future will be replaced by a data fetch call.
    // Most probably, an HTTP request.
    // The http status code will be used to determine any error.

    var futureData = Future.delayed(const Duration(seconds: 1), () {
      return ["This", "is", "delayed", "data"];
    });

    int statusCode = 400;

    if (statusCode >= 400) {
      throw HttpError(statusCode);
    }

    return futureData;
  }
}
