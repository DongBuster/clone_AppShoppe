import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Product {
  late String name;
  late String nameShop;
  late Map<String, dynamic> classify;
  late List<dynamic> image;
  late String percentSale;
  late String quantitySold;

  Product({
    required this.name,
    required this.nameShop,
    required this.classify,
    required this.image,
    required this.percentSale,
    required this.quantitySold,
  });

  /// Connect the generated [_$ProductRecommendFromJson] function to the `fromJson`
  /// factory.
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$ProductRecommendToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
