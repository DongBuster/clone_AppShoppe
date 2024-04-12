import 'package:flutter/material.dart';
import '../models/cartModel.dart';

class BoughtProduct with ChangeNotifier {
  List<CartModel> listBoughtProduct = [];

  List<CartModel> get getListBoughtProduct => listBoughtProduct;

  void addToListBoughtProduct(List<CartModel> models) {
    listBoughtProduct.addAll(models);
    notifyListeners();
  }

//  void removeProductToCart(CartModel model) {
//     listItems.removeWhere(
//       (item) =>
//           item.nameProduct == model.nameProduct &&
//           item.classify == model.classify,
//     );
//     listsGroupsByNameShop =
//         groupBy(listItems, (CartModel model) => model.nameShop);
//     notifyListeners();
//   }
  void removeProducts(List<CartModel> list) {
    for (var element in list) {
      listBoughtProduct.remove(element);
    }
    notifyListeners();
  }
}
