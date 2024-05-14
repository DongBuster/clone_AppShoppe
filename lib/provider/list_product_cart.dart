import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class ListProductCart with ChangeNotifier {
  List<ProductShoppingCartModel> listItems = [];
  Map<String, List<ProductShoppingCartModel>> listsGroupsByNameShop = {};

  List<ProductShoppingCartModel> get getListItems => listItems;
  Map<String, List<ProductShoppingCartModel>> get getlistsGroupsByNameShop =>
      listsGroupsByNameShop;

  void addProductToCart(ProductShoppingCartModel model) {
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
      listsGroupsByNameShop = groupBy(
          listItems, (ProductShoppingCartModel model) => model.nameShop);
    }

    notifyListeners();
  }

  void removeListProductToCart(List<ProductShoppingCartModel> list) {
    for (var model in list) {
      listItems.removeWhere(
        (item) =>
            item.nameProduct == model.nameProduct &&
            item.classify == model.classify,
      );
    }
    listsGroupsByNameShop =
        groupBy(listItems, (ProductShoppingCartModel model) => model.nameShop);
    notifyListeners();
  }

  void removeProductToCart(ProductShoppingCartModel model) {
    listItems.removeWhere(
      (item) =>
          item.nameProduct == model.nameProduct &&
          item.classify == model.classify,
    );
    listsGroupsByNameShop =
        groupBy(listItems, (ProductShoppingCartModel model) => model.nameShop);
    notifyListeners();
  }

  void addQuantityProductCart(int quantity, ProductShoppingCartModel model) {
    for (var cartModel in listItems) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts = quantity;
      }
    }
    notifyListeners();
  }
}
