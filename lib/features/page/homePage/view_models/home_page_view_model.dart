import 'package:flutter/widgets.dart';

import '../models/home_page_model.dart';

class HomePageViewModel with ChangeNotifier {
  HomePageModel state = HomePageModel.initial();
  void setStateHomePage(ScrollNotification notification) {
    if (notification.metrics.pixels < 20 &&
        notification.metrics.axis == Axis.vertical) {
      state.activeIconHeader = false;
      state.activeIconHomeFooter = false;
    } else if (notification.metrics.pixels >= 20 &&
        notification.metrics.axis == Axis.vertical) {
      state.activeIconHeader = true;
      state.activeIconHomeFooter = true;
    }
    notifyListeners();
  }
}
