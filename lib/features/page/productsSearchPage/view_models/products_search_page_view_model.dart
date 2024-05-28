import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../models/product.dart';

class ProductsSearchPageViewModel {
  Future<List<Product>> loadProductSearch(
      List<dynamic>? listIdProductSelected, List? otherSearch) async {
    // print(listIdProductSelected);
    List<Product> products = [];
    List remainingList = [];
    listIdProductSelected != null
        ? await Supabase.instance.client
            .from('products')
            .select()
            .inFilter('id', listIdProductSelected)
            .then((list) {
            // print(list);
            products = list.map((e) => Product.fromJson(e)).toList();
          })
        : null;
    //---- ------
    if (otherSearch != null) {
      Supabase.instance.client
          .from('products')
          .select()
          .inFilter('id', otherSearch)
          .then((list) {
        List<Product> listId = list.map((e) => Product.fromJson(e)).toList();

        products.addAll(listId);
      });
      remainingList = [...otherSearch];
    }

    //---- ------

    if (listIdProductSelected != null) {
      remainingList.addAll(listIdProductSelected);
    }
    await Supabase.instance.client
        .from('products')
        .select()
        .not('id', 'in', remainingList)
        .then((list) {
      List<Product> listId = list.map((e) => Product.fromJson(e)).toList();

      products.addAll(listId);
    });

    return products;
  }
}
