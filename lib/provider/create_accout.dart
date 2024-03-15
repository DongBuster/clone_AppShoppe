import 'package:flutter/material.dart';

class CreateAccout with ChangeNotifier {
  bool isCreate = false;
  bool get getIsCreate => isCreate;
  void setIsCreate() {
    isCreate = !isCreate;
    notifyListeners();
  }
}
