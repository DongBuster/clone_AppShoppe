// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_shopping_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductShoppingCartModel _$ProductShoppingCartModelFromJson(
        Map<String, dynamic> json) =>
    ProductShoppingCartModel(
      id: json['id'] as int,
      nameProduct: json['nameProduct'] as String,
      nameShop: json['nameShop'] as String,
      image: json['image'] as String,
      classify: json['classify'] as Map<String, dynamic>,
      numberOfProducts: json['numberOfProducts'] as int,
    );

Map<String, dynamic> _$ProductShoppingCartModelToJson(
        ProductShoppingCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameProduct': instance.nameProduct,
      'nameShop': instance.nameShop,
      'image': instance.image,
      'classify': instance.classify,
      'numberOfProducts': instance.numberOfProducts,
    };
