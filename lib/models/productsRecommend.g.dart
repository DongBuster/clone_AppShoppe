// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productsRecommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsRecommend _$ProductsRecommendFromJson(Map<String, dynamic> json) =>
    ProductsRecommend(
      name: json['name'] as String,
      nameShop: json['nameShop'] as String,
      classify: json['classify'] as Map<String, dynamic>,
      image: json['image'] as List<dynamic>,
      percentSale: json['percentSale'] as String,
      quantitySold: json['quantitySold'] as String,
    );

Map<String, dynamic> _$ProductsRecommendToJson(ProductsRecommend instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameShop': instance.nameShop,
      'classify': instance.classify,
      'image': instance.image,
      'percentSale': instance.percentSale,
      'quantitySold': instance.quantitySold,
    };
