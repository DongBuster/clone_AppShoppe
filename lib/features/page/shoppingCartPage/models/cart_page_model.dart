import 'product_shopping_cart_model.dart';

class CartPageModel {
  late List<ProductShoppingCartModel> listProductShoppingCart;
  late Map<String, List<ProductShoppingCartModel>>
      listProductShoppingCartByNameShop;
  late List<ProductShoppingCartModel> listSelectedProductShoppingCart;
  late Map<String, bool> listsCheckBoxShop;
  late Map<String, Map<String, bool>> listsCheckBoxByNameShop;
  late String totalPayment;
  CartPageModel({
    required this.listProductShoppingCart,
    required this.listProductShoppingCartByNameShop,
    required this.listSelectedProductShoppingCart,
    required this.listsCheckBoxShop,
    required this.listsCheckBoxByNameShop,
    required this.totalPayment,
  });

  CartPageModel.initial() {
    listProductShoppingCart = [];
    listProductShoppingCartByNameShop = {};
    listSelectedProductShoppingCart = [];
    listsCheckBoxShop = {};
    listsCheckBoxByNameShop = {};
    totalPayment = '';
  }

  @override
  bool operator ==(covariant CartPageModel other) {
    if (identical(this, other)) return true;

    return other.listProductShoppingCart == listProductShoppingCart &&
        other.listProductShoppingCartByNameShop ==
            listProductShoppingCartByNameShop &&
        other.listSelectedProductShoppingCart ==
            listSelectedProductShoppingCart &&
        other.listsCheckBoxShop == listsCheckBoxShop &&
        other.listsCheckBoxByNameShop == listsCheckBoxByNameShop &&
        other.totalPayment == totalPayment;
  }

  @override
  int get hashCode {
    return listProductShoppingCart.hashCode ^
        listProductShoppingCartByNameShop.hashCode ^
        listSelectedProductShoppingCart.hashCode ^
        listsCheckBoxShop.hashCode ^
        listsCheckBoxByNameShop.hashCode ^
        totalPayment.hashCode;
  }
}
