// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productSale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSale _$ProductSaleFromJson(Map<String, dynamic> json) => ProductSale(
      price: json['price'] as String,
      image: json['image'] as String,
      percentSale: json['percentSale'] as String,
    );

Map<String, dynamic> _$ProductSaleToJson(ProductSale instance) =>
    <String, dynamic>{
      'price': instance.price,
      'image': instance.image,
      'percentSale': instance.percentSale,
    };
