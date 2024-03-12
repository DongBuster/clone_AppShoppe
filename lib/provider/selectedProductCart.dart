import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/material.dart';

class SelectedProductCart with ChangeNotifier {
  List<CartModel> listSelected = [];
  String totalPrice = '0';

  String get getTotalPrice => totalPrice;
  List<CartModel> get getListSelected => listSelected;
  void calculateTotalPrice() {
    int sum = 0;

    for (var cartModel in listSelected) {
      int numberOfProducts = cartModel.numberOfProducts;
      int classifyValue = int.parse(
          cartModel.classify.values.first.toString().replaceAll('.', ''));
      sum += numberOfProducts * classifyValue;
    }
    totalPrice = sum.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    // totalPrice = totalPrice.toDouble();
    // listSelected.map((e) =>
    //     totalPrice += e.numberOfProducts * (int.parse(e.classify.keys.first)));
    notifyListeners();
  }

  void setItemsSelected(CartModel cartModel, bool isChecked) {
    isChecked ? listSelected.add(cartModel) : listSelected.remove(cartModel);
    calculateTotalPrice();
    notifyListeners();
  }

  void setListItemsSelected(List<CartModel> listcartModel, bool isChecked) {
    for (var cartModel in listcartModel) {
      if (isChecked && listSelected.contains(cartModel) == false) {
        listSelected.add(cartModel);
      } else if (isChecked == false) {
        listSelected.remove(cartModel);
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void setAllListItemsSelected(List<CartModel> listcartModel, bool isChecked) {
    for (var cartModel in listcartModel) {
      if (isChecked && listSelected.contains(cartModel) == false) {
        listSelected.add(cartModel);
      } else if (isChecked == false) {
        listSelected.remove(cartModel);
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }
}
