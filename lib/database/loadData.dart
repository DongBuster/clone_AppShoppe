import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class LoadData {
  static Future<List<dynamic>> loadStringFromAsset(String pathData) async {
    try {
      final jsonString = await rootBundle.loadString(pathData);
      // print(jsonString.runtimeType);
      // print(jsonDecode(jsonString));

      List<dynamic> data = jsonDecode(jsonString);
      // print(data.runtimeType);
      // print(data.runtimeType);
      // print(data);
      // List<dynamic> list = data.values.toList();
      // print(list.runtimeType);
      return data;
    } catch (e) {
      return ['error:$e'];
    }
  }
  // static Future<List> getModel(List<dynamic> data,var model)async{
  //   var listProduct = await LoadData.loadStringFromAsset(
  //         'lib/database/dataProductsRecommend.json');
  //   listProduct.map((e) => )
  //   return ;
  // }
}
