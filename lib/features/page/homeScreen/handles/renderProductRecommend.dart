import 'package:clone_shoppe/database/loadData.dart';
import 'package:clone_shoppe/features/page/homeScreen/widget/productRecommend.dart';
import 'package:clone_shoppe/models/productsRecommend.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RenderProductRecommend extends StatefulWidget {
  const RenderProductRecommend({super.key});

  @override
  State<RenderProductRecommend> createState() => _RenderProductRecommendState();
}

class _RenderProductRecommendState extends State<RenderProductRecommend> {
  List<ProductsRecommend> listProduct = [];
  late final _futureSupabase;

  // Future<Map<String, dynamic>> fetchData() async {
  //   final response =
  //       await Supabase.instance.client.from('products').select();
  //   if (response.error != null) {
  //     throw response.error.message;
  //   }
  //   return response.data as Map<String, dynamic>;
  // }
  @override
  void initState() {
    _futureSupabase = Supabase.instance.client.from('products').select();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: LoadData.loadStringFromAsset(
          'lib/database/dataProductsRecommend.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          // print('here');
          final jsonContent = snapshot.data;
          // print(jsonContent.runtimeType);
          var listProduct =
              jsonContent!.map((e) => ProductsRecommend.fromJson(e)).toList();
          // print(listProduct.first);

          // print(listProduct.first.classify);
          // print(jsonContent!.map((e) => e));
          // return Container();
          return GridView.builder(
            padding: const EdgeInsets.only(top: 3, left: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listProduct.length,
            itemBuilder: (context, index) => ProductRecommend(
              productsRecommend: listProduct[index],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
            ),
          );
        } else if (snapshot.hasError) {
          // print('no data');
          // print(snapshot.data);
          final errorMessage = snapshot.error.toString();
          return Text('Error: $errorMessage');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
