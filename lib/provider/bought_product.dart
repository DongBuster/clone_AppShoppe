import 'package:flutter/material.dart';
import '../models/cartModel.dart';

class BoughtProduct with ChangeNotifier {
  List<CartModel> listBoughtProduct = [];

  List<CartModel> get getListBoughtProduct => listBoughtProduct;

  void addToListBoughtProduct(List<CartModel> models) {
    listBoughtProduct.addAll(models);
    notifyListeners();
  }
}
