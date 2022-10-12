import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';

import '../models/http_error.dart';

/// The template for simple Providers that are used to fetch a single kind
/// of data, [T], from the backend. The [getData] function must be implemented
/// by the subclass. The [T] type is the type of the data that is fetched.

abstract class ProviderTemplate<T> extends ChangeNotifier {
  /// The data that is fetched from the backend.
  List<T> data = [];

  /// Must be implemented by the subclass. It should return a list of the type [T]
  /// that is fetched from the backend. The [ProviderTemplate] will store it in
  /// [data]. The [ProviderTemplate] will notify its listeners when the data is
  /// fetched.
  @protected
  Future<List<T>> getData();
  bool fetchedOnce = false;

  /// Must be implemented by the subclass. It should return an object of the type [T]
  /// It can be fetched from backend or found from [data].

  T findById(String id);

  /// [fetchData] is called from the Widget tree to fetch the data. The method
  /// returns null if the data has already been fetched. This is to prevent
  /// multiple requests for the same data.
  /// The force parameter can be used to force a new request, even if the data has
  /// already been fetched. Meant to be used with a [RefreshIndicator], such as in
  /// [RefreshableFutureScreenTemplate].
  Future<void> Function()? fetchData([bool force = false]) {
    if (data.isNotEmpty && !force) return null;
    if (!force && fetchedOnce) return null;
    print(data);
    print(force);
    print("didnt return null");
    fetchedOnce = true;
    return () async {
      try {
        data = await getData();
      } catch (_) {
        rethrow;
      }
      notifyListeners();
    };
  }

  int get length => data.length;
}
