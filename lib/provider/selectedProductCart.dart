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

    notifyListeners();
  }

  void setItemsSelected(CartModel cartModel, bool isChecked) {
    isChecked ? listSelected.add(cartModel) : listSelected.remove(cartModel);
    calculateTotalPrice();
    notifyListeners();
  }

  void setQuanityOfItemsSelected(int quantity, CartModel cartModel) {
    for (var item in listSelected) {
      if (cartModel.nameProduct == item.nameProduct &&
          cartModel.classify.keys.first == item.classify.keys.first) {
        item.numberOfProducts == quantity;
        // debugPrint('${item.numberOfProducts}');
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void removeItemsSelected(CartModel cartModel) {
    listSelected.remove(cartModel);
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
