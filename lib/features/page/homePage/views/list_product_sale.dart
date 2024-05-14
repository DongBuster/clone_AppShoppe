import 'package:clone_shoppe/features/page/homePage/resources/widgets/product_sale.dart';
import 'package:clone_shoppe/models/product_sale.dart';
import 'package:flutter/material.dart';
import '../data_source/service.dart';

class ListProductSale extends StatefulWidget {
  const ListProductSale({super.key});

  @override
  State<ListProductSale> createState() => _ListProductSaleState();
}

class _ListProductSaleState extends State<ListProductSale> {
  final homePageService = HomePageService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductSale>>(
      future: homePageService.getProductsFromFileJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final listProduct = snapshot.data!;

          return SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width - 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listProduct.length,
              itemBuilder: (context, index) => ProductSaleWidget(
                productSale: listProduct[index],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          final errorMessage = snapshot.error.toString();
          return Text('Error: $errorMessage');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
