import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/material.dart';

class SelectedProductCart with ChangeNotifier {
  List<CartModel> listSelected = [];

  void addItemSelected(CartModel model) {
    listSelected.add(model);
    notifyListeners();
  }

  // String calculatePriceItemSelected() {
  //   int sum = 0;
  //   for (var e in listSelected) {
  //     sum += int.parse(e.price);
  //     print(int.parse(e.price));
  //   }
  //   // print(sum);
  //   return sum.toString();
  // }
}
