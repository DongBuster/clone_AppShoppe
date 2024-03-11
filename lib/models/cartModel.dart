import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cartModel.g.dart';

@JsonSerializable()
class CartModel {
  late String nameProduct;
  late String nameShop;
  late List<dynamic> image;
  late Map<String, dynamic> classify;
  late int numberOfProducts;

  CartModel({
    required this.nameProduct,
    required this.nameShop,
    required this.image,
    required this.classify,
    required this.numberOfProducts,
  });
  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is CartModel &&
        other.nameProduct == nameProduct &&
        other.nameShop == nameShop &&
        listEquals(other.image, image) &&
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

  /// Connect the generated [_$CartModelFromJson] function to the `fromJson`
  /// factory.
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  /// Connect the generated [_$CartModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
