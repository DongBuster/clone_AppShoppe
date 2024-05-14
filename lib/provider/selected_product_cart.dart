import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:flutter/material.dart';

class SelectedProductCart with ChangeNotifier {
  List<ProductShoppingCartModel> listSelected = [];
  String totalPrice = '0';

  String get getTotalPrice => totalPrice;
  set setTotalPrice(String value) => totalPrice = value;
  List<ProductShoppingCartModel> get getListSelected => listSelected;
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

  void setItemsSelected(ProductShoppingCartModel cartModel, bool isChecked) {
    isChecked ? listSelected.add(cartModel) : listSelected.remove(cartModel);
    calculateTotalPrice();
    notifyListeners();
  }

  void setQuanityOfItemsSelected(
      int quantity, ProductShoppingCartModel cartModel) {
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

  void removeListItemsSelected(List<ProductShoppingCartModel> list) {
    // print('remove: $listSelected');

    listSelected.removeWhere((item) => list.contains(item));
    calculateTotalPrice();
    notifyListeners();
  }

  void removeItemsSelected(ProductShoppingCartModel model) {
    listSelected.removeWhere(
      (item) =>
          item.nameProduct == model.nameProduct &&
          item.classify == model.classify,
    );
    calculateTotalPrice();
    notifyListeners();
  }

  void setListItemsSelected(
      List<ProductShoppingCartModel> listcartModel, bool isChecked) {
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

  void setAllListItemsSelected(
      List<ProductShoppingCartModel> listcartModel, bool isChecked) {
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
