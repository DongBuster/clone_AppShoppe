import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_shopping_cart_model.g.dart';

@JsonSerializable()
class ProductShoppingCartModel {
  late int id;
  late String nameProduct;
  late String nameShop;
  late String image;
  late Map<String, dynamic> classify;
  late int numberOfProducts;

  ProductShoppingCartModel({
    required this.id,
    required this.nameProduct,
    required this.nameShop,
    required this.image,
    required this.classify,
    required this.numberOfProducts,
  });
  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is ProductShoppingCartModel &&
        other.nameProduct == nameProduct &&
        other.nameShop == nameShop &&
        other.image == image &&
        mapEquals(other.classify, classify) &&
        other.numberOfProducts == numberOfProducts;
  }

  @override
  int get hashCode =>
      nameProduct.hashCode ^
      nameShop.hashCode ^
      image.hashCode ^
      classify.hashCode ^
      numberOfProducts.hashCode;

  /// Connect the generated [_$ProductShoppingCartModelFromJson] function to the `fromJson`
  /// factory.
  factory ProductShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      _$ProductShoppingCartModelFromJson(json);

  /// Connect the generated [_$ProductShoppingCartModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductShoppingCartModelToJson(this);
}
