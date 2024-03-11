import 'package:flutter/material.dart';

class StateActiveIconHome with ChangeNotifier {
  bool isActiveIconHome = false;
  void setActiveIconHome() {
    isActiveIconHome = true;
    notifyListeners();
  }

  void setNotActiveIconHome() {
    isActiveIconHome = false;
    notifyListeners();
  }
}
