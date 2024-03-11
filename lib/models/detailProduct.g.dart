// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailProduct _$DetailProductFromJson(Map<String, dynamic> json) =>
    DetailProduct(
      name: json['name'] as String,
      image: json['image'] as List<dynamic>,
      nameShop: json['nameShop'] as String,
      classify: json['classify'] as Map<String, dynamic>,
      percentSale: json['percentSale'] as String,
      quantitySold: json['quantitySold'] as String,
    );

Map<String, dynamic> _$DetailProductToJson(DetailProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameShop': instance.nameShop,
      'classify': instance.classify,
      'image': instance.image,
      'percentSale': instance.percentSale,
      'quantitySold': instance.quantitySold,
    };
