import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../models/cart_page_model.dart';
import '../models/product_shopping_cart_model.dart';

class CartPageViewModel extends ChangeNotifier {
  CartPageModel stateCartPage = CartPageModel.initial();

  //--- state list product shopping cart ---
  void addProductToCart(ProductShoppingCartModel model) {
    var listItems = stateCartPage.listProductShoppingCart;
    var listProductShoppingCartByNameShop =
        stateCartPage.listProductShoppingCartByNameShop;
    bool itemExists = false;

    for (var cartModel in listItems) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts++;
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      listItems.add(model);
      listProductShoppingCartByNameShop = groupBy(
          listItems, (ProductShoppingCartModel model) => model.nameShop);
    }

    addItemsCheckbox(listProductShoppingCartByNameShop);

    notifyListeners();
  }

  void removeListProductToCart(List<ProductShoppingCartModel> list) {
    var listItems = stateCartPage.listProductShoppingCart;

    for (var model in list) {
      listItems.removeWhere(
        (item) =>
            item.nameProduct == model.nameProduct &&
            item.classify == model.classify,
      );
    }
    stateCartPage.listProductShoppingCartByNameShop =
        groupBy(listItems, (ProductShoppingCartModel model) => model.nameShop);
    notifyListeners();
  }

  void removeProductToCart(ProductShoppingCartModel model) {
    var listItems = stateCartPage.listProductShoppingCart;

    listItems.removeWhere(
      (item) =>
          item.nameProduct == model.nameProduct &&
          item.classify == model.classify,
    );
    stateCartPage.listProductShoppingCartByNameShop =
        groupBy(listItems, (ProductShoppingCartModel model) => model.nameShop);
    notifyListeners();
  }

  void addQuantityProductCart(int quantity, ProductShoppingCartModel model) {
    var listItems = stateCartPage.listProductShoppingCart;

    for (var cartModel in listItems) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts = quantity;
      }
    }
    notifyListeners();
  }

  //--- state list checkbox ---
  void addItemsCheckbox(
      Map<String, List<ProductShoppingCartModel>> listsGroupsByNameShop) {
    listsGroupsByNameShop.forEach(
      (shop, listProduct) {
        stateCartPage.listsCheckBoxShop[shop] = false;
        //----
        Map<String, bool> checkboxs = {};
        for (var product in listProduct) {
          checkboxs[product.classify.keys.first] = false;
        }
        stateCartPage.listsCheckBoxByNameShop[shop] = checkboxs;
      },
    );
    // print(stateCartPage.listsCheckBoxByNameShop.values);
    // print(stateCartPage.listsCheckBoxShop);

    notifyListeners();
  }

  void setCheckBox(String nameShop, String classify) {
    stateCartPage.listsCheckBoxByNameShop[nameShop]!.forEach((key, value) {
      stateCartPage.listsCheckBoxByNameShop[nameShop]![classify] =
          !stateCartPage.listsCheckBoxByNameShop[nameShop]![classify]!;
    });
    notifyListeners();
  }

  void setCheckBoxByShop(String nameShop) {
    stateCartPage.listsCheckBoxByNameShop[nameShop]!.forEach((key, value) {
      stateCartPage.listsCheckBoxByNameShop[nameShop]![key] =
          stateCartPage.listsCheckBoxShop[nameShop]!;
    });
    notifyListeners();
  }

  void setAllCheckBoxShop(bool isChecked) {
    stateCartPage.listsCheckBoxShop
        .updateAll((key, value) => isChecked ? value = true : value = false);
    stateCartPage.listsCheckBoxByNameShop.forEach(
      (key, values) {
        values.updateAll((key, value) => value = isChecked);
      },
    );

    notifyListeners();
  }

  void setCheckBoxShop(String nameShop) {
    stateCartPage.listsCheckBoxShop[nameShop] =
        stateCartPage.listsCheckBoxShop[nameShop]!;
    notifyListeners();
  }

  //--- state list selected product ----
  void calculateTotalPrice() {
    int sum = 0;

    for (var cartModel in stateCartPage.listSelectedProductShoppingCart) {
      int numberOfProducts = cartModel.numberOfProducts;
      int classifyValue = int.parse(
          cartModel.classify.values.first.toString().replaceAll('.', ''));
      sum += numberOfProducts * classifyValue;
    }
    stateCartPage.totalPayment = sum.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');

    notifyListeners();
  }

  void removeListItemsSelected(List<ProductShoppingCartModel> list) {
    // print('remove: $listSelected');

    stateCartPage.listSelectedProductShoppingCart
        .removeWhere((item) => list.contains(item));
    calculateTotalPrice();
    notifyListeners();
  }
}
