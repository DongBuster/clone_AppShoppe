import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:flutter/material.dart';

class CheckBoxCartScreen with ChangeNotifier {
  Map<String, bool> listsCheckBoxShop = {};
  Map<String, Map<String, bool>> listsCheckBoxByShop = {};

  void addItemsCheckbox(
      Map<String, List<ProductShoppingCartModel>> listsGroupsByNameShop) {
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

  void setCheckBox(String nameShop, String classify) {
    listsCheckBoxByShop[nameShop]!.forEach((key, value) {
      listsCheckBoxByShop[nameShop]![classify] =
          !listsCheckBoxByShop[nameShop]![classify]!;
    });
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
        values.updateAll((key, value) => value = isChecked);
      },
    );

    notifyListeners();
  }

  void setCheckBoxShop(String nameShop) {
    listsCheckBoxShop[nameShop] = !listsCheckBoxShop[nameShop]!;
    notifyListeners();
  }
}
