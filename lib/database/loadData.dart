// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart ' as supabase;

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

class Images {
  late List<dynamic> image;
  Images({
    required this.image,
  });
  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'] as List<dynamic>;
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
      // if (pathData == 'lib/database/dataProductsRecommend.json') {
      // print('ksk');
      // var listProduct = data.map((e) => Images.fromJson(e)).toList();
      // int id = 0;
      // for (var e1 in listProduct) {
      //   int count = 0;
      //   var listUrlImage = [];

      //   for (var e2 in e1.image) {
      //     ByteData byteData = await rootBundle.load(e2);
      //     var bytes = byteData.buffer
      //         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      //     final filename = 'id:${id}_images$count.jpg';
      //     final firebaseStorageRef = FirebaseStorage.instance
      //         .ref()
      //         .child('image_products/$id/$filename');
      //     final metadata = SettableMetadata(
      //       contentType: 'image/jpeg',
      //     );
      //     final uploadTask = firebaseStorageRef.putData(bytes, metadata);
      //     await uploadTask.then((task) {
      //       task.ref.getDownloadURL().then((urlImage) async {
      //         listUrlImage.add(urlImage);
      //         // print(listUrlImage);
      //       });
      //     });
      //     count++;
      //   }
      //   print(id);
      //   // print(listUrlImage);
      //   await Supabase.instance.client
      //       .from('products')
      //       .update({'image': listUrlImage}).eq('id', id);
      //   // .match({'id': id});
      //   id++;
      // }
      // }
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
