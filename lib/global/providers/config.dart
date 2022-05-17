import 'package:flutter/cupertino.dart';

class Config extends ChangeNotifier {
  bool bottomBarVisible = true;

  void toggleBottomBar() {
    bottomBarVisible = !bottomBarVisible;
    notifyListeners();
  }

  void showBottomBar() {
    bottomBarVisible = true;
    notifyListeners();
  }

  void hideBottomBar() {
    bottomBarVisible = false;
    notifyListeners();
  }
}
