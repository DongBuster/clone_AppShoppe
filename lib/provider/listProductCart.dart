import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class ListProductCart with ChangeNotifier {
  List<CartModel> listItems = [];
  Map<String, List<CartModel>> listsGroupsByNameShop = {};

  List<CartModel> get getListItems => listItems;
  Map<String, List<CartModel>> get getlistsGroupsByNameShop =>
      listsGroupsByNameShop;

  void addProductToCart(CartModel model) {
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
      listsGroupsByNameShop =
          groupBy(listItems, (CartModel model) => model.nameShop);
    }

    notifyListeners();
  }

  void removeListProductToCart(List<CartModel> list) {
    for (var model in list) {
      listItems.removeWhere(
        (item) =>
            item.nameProduct == model.nameProduct &&
            item.classify == model.classify,
      );
    }
    listsGroupsByNameShop =
        groupBy(listItems, (CartModel model) => model.nameShop);
    notifyListeners();
  }

  void removeProductToCart(CartModel model) {
    listItems.removeWhere(
      (item) =>
          item.nameProduct == model.nameProduct &&
          item.classify == model.classify,
    );
    listsGroupsByNameShop =
        groupBy(listItems, (CartModel model) => model.nameShop);
    notifyListeners();
  }

  void addQuantityProductCart(int quantity, CartModel model) {
    for (var cartModel in listItems) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts = quantity;
      }
    }
    notifyListeners();
  }
}
