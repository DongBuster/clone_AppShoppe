import 'package:flutter/widgets.dart';

class StateActiveColorIconHeader with ChangeNotifier {
  bool isActiveColorIcon = false;
  void setActiveColorIconHeader() {
    isActiveColorIcon = true;
    notifyListeners();
  }

  void setNotActiveColorIconHeader() {
    isActiveColorIcon = false;
    notifyListeners();
  }
}
