import 'package:flutter/cupertino.dart';
import 'package:tedx_dtu_app/profile/screens/profile_screen.dart';

enum CurrentInnerWidget {
  mainProfile,
  mainSettings,
  editProfile,
  changePassword,
}

/// This class is only used locally, no connection to the backend.
/// It is used to set and get the current inner widget in the [ProfileScreen]
class ProfileInnerWidgetProvider with ChangeNotifier {
  CurrentInnerWidget _currentInnerWidget = CurrentInnerWidget.editProfile;

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
