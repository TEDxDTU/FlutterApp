import 'package:flutter/cupertino.dart';

enum CurrentInnerWidget {
  mainProfile,
  mainSettings,
  editProfile,
  changePassword,
}

class ProfileInnerWidgetProvider with ChangeNotifier {
  CurrentInnerWidget _currentInnerWidget = CurrentInnerWidget.mainSettings;

  set currentInnerWidget(CurrentInnerWidget currentInnerWidget) {
    _currentInnerWidget = currentInnerWidget;
    notifyListeners();
  }

  CurrentInnerWidget get currentInnerWidget => _currentInnerWidget;

  String get appBarTitle {
    switch (_currentInnerWidget) {
      case CurrentInnerWidget.mainProfile:
        return "Profile";
      case CurrentInnerWidget.mainSettings:
      case CurrentInnerWidget.editProfile:
      case CurrentInnerWidget.changePassword:
        return "Settings";
      default:
        return "Profile";
    }
  }

  // This is dummy code, will be replaced in another provider for notifications,
  // or through firebase.
  bool notifsOn = false;
  void reverseNotifs() {
    notifsOn = !notifsOn;
    notifyListeners();
  }
}
