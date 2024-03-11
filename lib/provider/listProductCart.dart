import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class ListProductCart with ChangeNotifier {
  List<CartModel> listItems = [];
  Map<String, List<CartModel>> listsGroupsByNameShop = {};

  List get getListItems => listItems;
  Map<String, List<CartModel>> get getlistsGroupsByNameShop =>
      listsGroupsByNameShop;

  void addProductToCart(CartModel model) {
    if (listItems.contains(model)) {
      // print('cccc');
      listItems[listItems.indexOf(model)].numberOfProducts++;
    } else {
      // print('here');
      listItems.add(model);
      listsGroupsByNameShop =
          groupBy(listItems, (CartModel model) => model.nameShop);
    }

    // print('${model.nameProduct}:${model.classify.keys.first}');
    // print(listItems.);
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
}
