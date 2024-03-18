// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      nameProduct: json['nameProduct'] as String,
      nameShop: json['nameShop'] as String,
      image: json['image'] as String,
      classify: json['classify'] as Map<String, dynamic>,
      numberOfProducts: json['numberOfProducts'] as int,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'nameProduct': instance.nameProduct,
      'nameShop': instance.nameShop,
      'image': instance.image,
      'classify': instance.classify,
      'numberOfProducts': instance.numberOfProducts,
    };
