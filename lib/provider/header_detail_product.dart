import 'package:flutter/widgets.dart';

class SateHeaderDetailProduct with ChangeNotifier {
  bool isChangeHeader = false;

  bool get getIsChangeHeader => isChangeHeader;

  void setActiveChangeHeader() {
    isChangeHeader = true;
    notifyListeners();
  }

  void setNotActiveChangeHeader() {
    isChangeHeader = false;
    notifyListeners();
  }
}
