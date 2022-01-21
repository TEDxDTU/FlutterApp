import 'package:flutter/cupertino.dart';

enum CurrentInnerWidget {
  mainProfile,
  mainSettings,
  editProfile,
  changePassword,
}

class ProfileInnerWidgetProvider with ChangeNotifier {
  CurrentInnerWidget _currentInnerWidget = CurrentInnerWidget.mainProfile;

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
}
