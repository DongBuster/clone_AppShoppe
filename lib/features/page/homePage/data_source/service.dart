import 'package:clone_shoppe/models/product.dart';
import 'package:clone_shoppe/models/product_sale.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../database/load_data.dart';

class HomePageService {
  Future<List<Product>> getProducts() async {
    List<Product> result = [];
    await Supabase.instance.client.from('products').select().then((data) {
      result = data.map((e) => Product.fromJson(e)).toList();
    });
    return result;
  }

  Future<List<ProductSale>> getProductsFromFileJson() async {
    List<ProductSale> result = [];
    await LoadData.loadStringFromAsset('lib/database/dataProductsSale.json')
        .then((data) {
      result = data.map((e) => ProductSale.fromJson(e)).toList();
    });
    return result;
  }
}
