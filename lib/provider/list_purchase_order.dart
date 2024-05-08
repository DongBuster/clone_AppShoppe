import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class ListProductPurchureOder with ChangeNotifier {
  List<CartModel> listProductPurchureOder = [];
  List<CartModel> get getListProductPurchureOder => listProductPurchureOder;

  void addToList(List<CartModel> list) {
    listProductPurchureOder.addAll(list);
    // print(listProductPurchureOder);
    notifyListeners();
  }

  void removeProductToList(List<CartModel> list) {
    for (var element in list) {
      listProductPurchureOder.remove(element);
    }
    notifyListeners();
  }
}
