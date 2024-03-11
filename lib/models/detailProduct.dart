import 'package:json_annotation/json_annotation.dart';

part 'detailProduct.g.dart';

@JsonSerializable()
class DetailProduct {
  late String name;
  late String nameShop;
  late Map<String, dynamic> classify;
  late List<dynamic> image;
  late String percentSale;
  late String quantitySold;

  DetailProduct({
    required this.name,
    required this.image,
    required this.nameShop,
    required this.classify,
    required this.percentSale,
    required this.quantitySold,
  });

  /// Connect the generated [_$DetailProductFromJson] function to the `fromJson`
  /// factory.
  factory DetailProduct.fromJson(Map<String, dynamic> json) =>
      _$DetailProductFromJson(json);

  /// Connect the generated [_$DetailProductToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DetailProductToJson(this);
}
