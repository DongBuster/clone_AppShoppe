import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../models/cart_page_model.dart';
import '../models/product_shopping_cart_model.dart';

class CartPageViewModel extends ChangeNotifier {
  CartPageModel stateCartPage = CartPageModel.initial();

  //--- state list product shopping cart ---
  void addProductToCart(ProductShoppingCartModel model) {
    // var listItems = stateCartPage.listProductShoppingCart;
    // var listProductShoppingCartByNameShop =
    //     stateCartPage.listProductShoppingCartByNameShop;
    bool itemExists = false;

    for (var cartModel in stateCartPage.listProductShoppingCart) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts++;
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      stateCartPage.listProductShoppingCart.add(model);
      stateCartPage.listProductShoppingCartByNameShop = groupBy(
          stateCartPage.listProductShoppingCart,
          (ProductShoppingCartModel model) => model.nameShop);
    }

    addItemsCheckbox(stateCartPage.listProductShoppingCartByNameShop);
    // print(stateCartPage.listsCheckBoxShop.length);

    // print(stateCartPage.listProductShoppingCart.length);

    // print(stateCartPage.listProductShoppingCartByNameShop.length);
    notifyListeners();
  }

  void removeListProductToCart() {
    var listItems = stateCartPage.listProductShoppingCart;

    for (var model in stateCartPage.listSelectedProductShoppingCart) {
      listItems.removeWhere(
        (item) =>
            item.nameProduct == model.nameProduct &&
            item.classify == model.classify,
      );
    }
    stateCartPage.listSelectedProductShoppingCart = [];
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

  void setQuantityProductCart(int quantity, ProductShoppingCartModel model) {
    var listItems = stateCartPage.listProductShoppingCart;

    for (var cartModel in listItems) {
      if (cartModel.nameProduct == model.nameProduct &&
          cartModel.classify.keys.first == model.classify.keys.first) {
        cartModel.numberOfProducts = quantity;
      }
    }
    // setQuanityOfItemsSelected(quantity, model);/////
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

  void setCheckBox(
      ProductShoppingCartModel model, String nameShop, String classify) {
    stateCartPage.listsCheckBoxByNameShop[nameShop]!.forEach((key, value) {
      stateCartPage.listsCheckBoxByNameShop[nameShop]![classify] =
          !stateCartPage.listsCheckBoxByNameShop[nameShop]![classify]!;
      setItemsSelected(
          model, stateCartPage.listsCheckBoxByNameShop[nameShop]![classify]!);
    });
    notifyListeners();
  }

  void setCheckBoxByShop(String nameShop) {
    stateCartPage.listsCheckBoxByNameShop[nameShop]!.forEach((key, value) {
      stateCartPage.listsCheckBoxByNameShop[nameShop]![key] =
          stateCartPage.listsCheckBoxShop[nameShop]!;
      setListItemsSelected(
          nameShop, stateCartPage.listsCheckBoxByNameShop[nameShop]![key]!);
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
    setAllListItemsSelected(isChecked);
    // setListItemsSelected(nameShop, isChecked);
    notifyListeners();
  }

  void setCheckBoxShop(String nameShop) {
    stateCartPage.listsCheckBoxShop[nameShop] =
        !stateCartPage.listsCheckBoxShop[nameShop]!;
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

  void setItemsSelected(ProductShoppingCartModel cartModel, bool isChecked) {
    isChecked
        ? stateCartPage.listSelectedProductShoppingCart.add(cartModel)
        : stateCartPage.listSelectedProductShoppingCart.remove(cartModel);
    // print(stateCartPage.listSelectedProductShoppingCart);

    calculateTotalPrice();
    notifyListeners();
  }

  void removeListItemsSelected(List<ProductShoppingCartModel> list) {
    // print('remove: $listSelected');

    stateCartPage.listSelectedProductShoppingCart
        .removeWhere((item) => list.contains(item));
    calculateTotalPrice();
    notifyListeners();
  }

  void setQuanityOfItemsSelected(
      int quantity, ProductShoppingCartModel cartModel) {
    // print('heere');
    // print(stateCartPage.listSelectedProductShoppingCart);
    for (var item in stateCartPage.listSelectedProductShoppingCart) {
      if (cartModel.nameProduct == item.nameProduct &&
          cartModel.classify.keys.first == item.classify.keys.first) {
        item.numberOfProducts == quantity;
        // debugPrint('quanity${item.numberOfProducts}');
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void removeItemsSelected(ProductShoppingCartModel model) {
    stateCartPage.listSelectedProductShoppingCart.removeWhere(
      (item) =>
          item.nameProduct == model.nameProduct &&
          item.classify == model.classify,
    );
    calculateTotalPrice();
    notifyListeners();
  }

  void setListItemsSelected(String nameShop, bool isChecked) {
    for (var cartModel
        in stateCartPage.listProductShoppingCartByNameShop[nameShop]!) {
      if (isChecked &&
          stateCartPage.listSelectedProductShoppingCart.contains(cartModel) ==
              false) {
        stateCartPage.listSelectedProductShoppingCart.add(cartModel);
      } else if (isChecked == false) {
        stateCartPage.listSelectedProductShoppingCart.remove(cartModel);
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void setAllListItemsSelected(bool isChecked) {
    for (var cartModel in stateCartPage.listProductShoppingCart) {
      if (isChecked &&
          stateCartPage.listSelectedProductShoppingCart.contains(cartModel) ==
              false) {
        stateCartPage.listSelectedProductShoppingCart.add(cartModel);
      } else if (isChecked == false) {
        stateCartPage.listSelectedProductShoppingCart.remove(cartModel);
      }
    }
    calculateTotalPrice();
    notifyListeners();
  }
}
