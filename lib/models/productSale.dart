import 'package:json_annotation/json_annotation.dart';

part 'productSale.g.dart';

@JsonSerializable()
class ProductSale {
  late String price;
  late String image;
  late String percentSale;

  ProductSale({
    required this.price,
    required this.image,
    required this.percentSale,
  });

  /// Connect the generated [_$ProductSaleFromJson] function to the `fromJson`
  /// factory.
  factory ProductSale.fromJson(Map<String, dynamic> json) =>
      _$ProductSaleFromJson(json);

  /// Connect the generated [_$ProductSaleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductSaleToJson(this);
}
