import 'package:flutter/material.dart';
import 'package:fooderlich/models/user.dart';

class ProfileManager extends ChangeNotifier {
  var _didSelectUser = false;
  var _tapOnRayWenderlich = false;
  bool _darkMode = false;

  User get getUser => User(
      firstName: 'Joe',
      lastName: 'Smith',
      role: 'Engineer',
      profileImageUrl: 'assets/profile_pics/person_joe.jpeg',
      points: 100,
      darkMode: _darkMode);

  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;
  bool get didTapOnRayWenderlich => _tapOnRayWenderlich;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnRayWenderlich(bool selected) {
    _tapOnRayWenderlich = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
