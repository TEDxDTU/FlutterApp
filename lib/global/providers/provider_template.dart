import 'package:flutter/cupertino.dart';

abstract class ProviderTemplate<T> extends ChangeNotifier {
  List<T> data = [];
  @protected
  Future<List<T>> getData();
  Future<void> Function()? fetchData([bool force = false]) {
    if (data.isNotEmpty && !force) return null;
    return () async {
      data = await getData();
      notifyListeners();
    };
  }
}
