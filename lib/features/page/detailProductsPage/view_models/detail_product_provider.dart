import 'package:flutter/material.dart';

import '../models/detail_product_page_model.dart';

class DetailProductViewModel with ChangeNotifier {
  DetailProductPageModel state = DetailProductPageModel.initial();

  void setIsChangeHeader(ScrollNotification notification) {
    if (notification.metrics.pixels <= 20 &&
        notification.metrics.axis == Axis.vertical) {
      state.setIsChangeHeader = false;
    }
    if (notification.metrics.pixels > 20 &&
        notification.metrics.axis == Axis.vertical) {
      state.setIsChangeHeader = true;
    }
    notifyListeners();
  }

  void setIsChangeHeaderFalse() {
    state.setIsChangeHeader = false;
    notifyListeners();
  }
}
