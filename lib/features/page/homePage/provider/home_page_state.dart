import 'package:flutter/widgets.dart';

import '../models/home_page_model.dart';

class HomePageState with ChangeNotifier {
  HomePageModel homePageModel = HomePageModel.initial();
  HomePageModel get getState => homePageModel;
  // bool isActiveColorIcon = false;
  void setStateTrue() {
    homePageModel.setActiveIconHeader = true;
    homePageModel.setActiveIconHomeFooter = true;
    notifyListeners();
  }

  void setStateFalse() {
    homePageModel.setActiveIconHeader = false;
    homePageModel.setActiveIconHomeFooter = false;
    notifyListeners();
  }
}
