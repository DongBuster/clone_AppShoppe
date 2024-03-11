import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:flutter/material.dart';

class DetailProductModel with ChangeNotifier {
  DetailProduct detailProduct = DetailProduct(
      name: '',
      nameShop: '',
      image: [],
      classify: {},
      percentSale: '',
      quantitySold: '');

  DetailProduct get detailProductModel => detailProduct;
  void setValueDetailProductModel(DetailProduct model) {
    detailProduct.name = model.name;
    detailProduct.nameShop = model.nameShop;
    detailProduct.image = model.image;
    detailProduct.classify = model.classify;
    detailProduct.percentSale = model.percentSale;
    detailProduct.quantitySold = model.quantitySold;
    notifyListeners();
  }

  void removeValueDetailProductModel(DetailProduct model) {
    detailProduct.name = '';
    detailProduct.nameShop = '';
    detailProduct.image = [];
    detailProduct.classify = {};
    detailProduct.percentSale = '';
    detailProduct.quantitySold = '';
    notifyListeners();
  }
}
