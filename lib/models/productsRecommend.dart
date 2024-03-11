import 'package:json_annotation/json_annotation.dart';

part 'productsRecommend.g.dart';

@JsonSerializable()
class ProductsRecommend {
  late String name;
  late String nameShop;
  late Map<String, dynamic> classify;
  late List<dynamic> image;
  late String percentSale;
  late String quantitySold;

  ProductsRecommend({
    required this.name,
    required this.nameShop,
    required this.classify,
    required this.image,
    required this.percentSale,
    required this.quantitySold,
  });

  /// Connect the generated [_$ProductRecommendFromJson] function to the `fromJson`
  /// factory.
  factory ProductsRecommend.fromJson(Map<String, dynamic> json) =>
      _$ProductsRecommendFromJson(json);

  /// Connect the generated [_$ProductRecommendToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductsRecommendToJson(this);
}
