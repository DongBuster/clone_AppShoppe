import 'package:flutter/material.dart';

import '../features/page/shoppingCartPage/models/product_shopping_cart_model.dart';

class ListProductPurchureOder with ChangeNotifier {
  List<ProductShoppingCartModel> listProductPurchureOder = [];
  List<ProductShoppingCartModel> get getListProductPurchureOder =>
      listProductPurchureOder;

  void addToList(List<ProductShoppingCartModel> list) {
    listProductPurchureOder.addAll(list);
    // print(listProductPurchureOder);
    notifyListeners();
  }

  void removeProductToList(List<ProductShoppingCartModel> list) {
    for (var element in list) {
      listProductPurchureOder.remove(element);
    }
    notifyListeners();
  }
}
