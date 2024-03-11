import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/material.dart';

class CheckBoxCartScreen with ChangeNotifier {
  Map<String, bool> listsCheckBoxShop = {};
  Map<String, Map<String, bool>> listsCheckBoxByShop = {};
  List<CartModel> listSelected = [];
  int totalPrice = 0;

  int get getTotalPrice => totalPrice;
  void calculateTotalPrice() {
    listSelected.map((e) =>
        totalPrice += e.numberOfProducts * (int.parse(e.classify.keys.first)));
    print(totalPrice);
    notifyListeners();
  }

  void addItemsSelected(CartModel cartModel) {
    listSelected.add(cartModel);
    notifyListeners();
  }

  void removeItemsSelected(CartModel cartModel) {
    listSelected.remove(cartModel);
    notifyListeners();
  }

  void removeListItemsSelected(List<CartModel> cartModel) {
    cartModel.map((e) => listSelected.remove(e));
    notifyListeners();
  }

  void addItemsCheckbox(Map<String, List<CartModel>> listsGroupsByNameShop) {
    listsGroupsByNameShop.forEach(
      (shop, listProduct) {
        listsCheckBoxShop[shop] = false;
        //----
        Map<String, bool> checkboxs = {};
        for (var product in listProduct) {
          checkboxs[product.classify.keys.first] = false;
        }
        listsCheckBoxByShop[shop] = checkboxs;
      },
    );
    // print(listsCheckBoxByShop.values);
    // print(listsCheckBoxShop);

    notifyListeners();
  }

  void setCheckBoxByShop(String nameShop) {
    listsCheckBoxByShop[nameShop]!.forEach((key, value) {
      listsCheckBoxByShop[nameShop]![key] = listsCheckBoxShop[nameShop]!;
    });
    notifyListeners();
  }

  void setAllCheckBoxShop(bool isChecked) {
    listsCheckBoxShop
        .updateAll((key, value) => isChecked ? value = true : value = false);
    listsCheckBoxByShop.forEach(
      (key, values) {
        values.updateAll((key, value) => value = !value);
      },
    );
    // print(listsCheckBoxShop);

    notifyListeners();
  }

  void setCheckBoxShop(String nameShop) {
    listsCheckBoxShop[nameShop] = !listsCheckBoxShop[nameShop]!;
    notifyListeners();
  }
}
