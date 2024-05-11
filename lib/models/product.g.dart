// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      nameShop: json['nameShop'] as String,
      classify: json['classify'] as Map<String, dynamic>,
      image: json['image'] as List<dynamic>,
      percentSale: json['percentSale'] as String,
      quantitySold: json['quantitySold'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameShop': instance.nameShop,
      'classify': instance.classify,
      'image': instance.image,
      'percentSale': instance.percentSale,
      'quantitySold': instance.quantitySold,
    };
