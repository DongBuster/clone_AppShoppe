import 'package:flutter/material.dart';

import '../models/detail_product_page.dart';

class StateDetailProduct with ChangeNotifier {
  DetailProductPageModel detailProductPageModel =
      DetailProductPageModel.initial();

  DetailProductPageModel get getStateDetailProduct => detailProductPageModel;
  void setIsChangeHeader(ScrollNotification notification) {
    if (notification.metrics.pixels <= 20 &&
        notification.metrics.axis == Axis.vertical) {
      detailProductPageModel.setIsChangeHeader = false;
    }
    if (notification.metrics.pixels > 20 &&
        notification.metrics.axis == Axis.vertical) {
      detailProductPageModel.setIsChangeHeader = true;
    }
    notifyListeners();
  }

  void setIsChangeHeaderFalse() {
    detailProductPageModel.setIsChangeHeader = false;
    notifyListeners();
  }
}
