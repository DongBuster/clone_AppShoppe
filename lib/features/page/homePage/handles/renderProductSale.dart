import 'package:clone_shoppe/database/loadData.dart';
import 'package:clone_shoppe/features/page/homePage/widget/productSale.dart';
import 'package:clone_shoppe/models/productSale.dart';
import 'package:flutter/material.dart';

class RenderProductSale extends StatefulWidget {
  const RenderProductSale({super.key});

  @override
  State<RenderProductSale> createState() => _RenderProductSaleState();
}

class _RenderProductSaleState extends State<RenderProductSale> {
  List<ProductSale> listProduct = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future:
          LoadData.loadStringFromAsset('lib/database/dataProductsSale.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // final jsonContent = snapshot.data;
          // // print(jsonContent);
          // listProduct =
          //     jsonContent!.map((e) => ProductSale.fromJson(e)).toList();
          // print(listProduct);

          // return SizedBox(
          //   height: 500,
          //   width: MediaQuery.of(context).size.width - 20,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: listProduct.length,
          //     itemBuilder: (context, index) => ProductSaleWidget(
          //       productSale: listProduct[index],
          //     ),
          //   ),
          // );
        } else if (snapshot.hasError) {
          final errorMessage = snapshot.error.toString();
          return Text('Error: $errorMessage');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
