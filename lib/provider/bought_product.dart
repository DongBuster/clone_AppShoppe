import 'package:flutter/material.dart';
import '../features/page/shoppingCartPage/models/product_shopping_cart_model.dart';

class BoughtProduct with ChangeNotifier {
  List<ProductShoppingCartModel> listBoughtProduct = [];

  List<ProductShoppingCartModel> get getListBoughtProduct => listBoughtProduct;

  void addToListBoughtProduct(List<ProductShoppingCartModel> models) {
    listBoughtProduct.addAll(models);
    notifyListeners();
  }

//  void removeProductToCart(ProductShoppingCartModel model) {
//     listItems.removeWhere(
//       (item) =>
//           item.nameProduct == model.nameProduct &&
//           item.classify == model.classify,
//     );
//     listsGroupsByNameShop =
//         groupBy(listItems, (ProductShoppingCartModel model) => model.nameShop);
//     notifyListeners();
//   }
  void removeProducts(List<ProductShoppingCartModel> list) {
    for (var element in list) {
      listBoughtProduct.remove(element);
    }
    notifyListeners();
  }
}
