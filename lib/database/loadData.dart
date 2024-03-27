// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:supabase_flutter/supabase_flutter.dart';

class FileJson {
  late String name;
  late String nameShop;
  late Map<String, dynamic> classify;
  late List<dynamic> image;
  late String quantitySold;
  late String productPortfolio;
  late String productType;
  late String percentSale;
  FileJson({
    required this.name,
    required this.nameShop,
    required this.classify,
    required this.image,
    required this.quantitySold,
    required this.productPortfolio,
    required this.productType,
    required this.percentSale,
  });

  FileJson.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    nameShop = json['nameShop'] ?? '';
    classify = json['classify'] ?? '';
    quantitySold = json['quantitySold'] ?? '';
    productPortfolio = json['productPortfolio'] ?? '';
    productType = json['productType'] ?? '';
    percentSale = json['percentSale'] ?? '';
  }
}

class LoadData {
  static Future<List<dynamic>> loadStringFromAsset(String pathData) async {
    try {
      final jsonString = await rootBundle.loadString(pathData);
      // print(jsonString.runtimeType);
      // print(jsonDecode(jsonString));
      // final supabase = Supabase.instance.client;

      List<dynamic> data = jsonDecode(jsonString);
      // List<FileJson> listProduct =
      //     data.map((e) => FileJson.fromJson(e)).toList();
      // int count = 0;
      // for (var e in listProduct) {
      //   await supabase.from('products').insert({
      //     'id': '$count',
      //     'name': e.name,
      //     'nameShop': e.nameShop,
      //     'classify': e.classify,
      //     'image': e.image,
      //     'portfolio': e.productPortfolio,
      //     'type': e.productType,
      //     'quantitySold': e.quantitySold,
      //     'percentSale': e.percentSale,
      //   });
      //   count++;
      // }
      // print(data.runtimeType);
      // print(data);
      // List<dynamic> list = data.values.toList();
      // print(list.runtimeType);
      return data;
    } catch (e) {
      return ['error:$e'];
    }
  }
}
