import 'package:clone_shoppe/features/page/homePage/widget/productRecommend.dart';
import 'package:clone_shoppe/models/product.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RenderProductRecommend extends StatefulWidget {
  const RenderProductRecommend({super.key});

  @override
  State<RenderProductRecommend> createState() => _RenderProductRecommendState();
}

class _RenderProductRecommendState extends State<RenderProductRecommend> {
  List<Product> listProduct = [];
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
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _futureSupabase,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          // print('here');
          final jsonContent = snapshot.data;
          // print(jsonContent!.length);
          var listProduct =
              jsonContent!.map((e) => Product.fromJson(e)).toList();
          // print(jsonContent.first.runtimeType);
          // jsonContent.map((e) => print(e.runtimeType));

          // print(listProduct.length);
          // print(jsonContent!.map((e) => e));
          // return Container();
          return GridView.builder(
            padding: const EdgeInsets.only(top: 5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listProduct.length,
            itemBuilder: (context, index) => ProductRecommend(
              productsRecommend: listProduct[index],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 275,
              mainAxisSpacing: 10,
              // crossAxisSpacing: 5,
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
