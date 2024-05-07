import 'package:clone_shoppe/features/page/homePage/widgets/product_recommend.dart';
import 'package:clone_shoppe/models/product.dart';
import 'package:flutter/material.dart';
import '../service/home_page_service.dart';

class ListProductRecommend extends StatefulWidget {
  const ListProductRecommend({super.key});

  @override
  State<ListProductRecommend> createState() => _ListProductRecommendState();
}

class _ListProductRecommendState extends State<ListProductRecommend> {
  final homePageService = HomePageService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: homePageService.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final listProduct = snapshot.data;

          return GridView.builder(
            padding: const EdgeInsets.only(top: 5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listProduct!.length,
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
