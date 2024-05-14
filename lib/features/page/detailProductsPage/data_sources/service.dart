import 'package:clone_shoppe/features/page/detailProductsPage/models/detail_product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailProductService {
  Future<DetailProduct> getProducts(int id) async {
    List<DetailProduct> result = [];
    await Supabase.instance.client
        .from('products')
        .select()
        .match({'id': id}).then((data) {
      result = data.map((e) => DetailProduct.fromJson(e)).toList();
    });
    return result[0];
  }
}
