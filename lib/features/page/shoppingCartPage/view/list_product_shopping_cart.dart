import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/list_product_cart.dart';
import 'product_shopping_cart.dart';
import '../resources/widgets/header_detail_shopping_cart.dart';

class ListProductShoppingCart extends StatefulWidget {
  const ListProductShoppingCart({super.key});

  @override
  State<ListProductShoppingCart> createState() =>
      _ListProductShoppingCartState();
}

class _ListProductShoppingCartState extends State<ListProductShoppingCart> {
  @override
  Widget build(BuildContext context) {
    var listsGroupsByNameShop =
        Provider.of<ListProductCart>(context, listen: true)
            .listsGroupsByNameShop;

    return listsGroupsByNameShop.isEmpty
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: const Text('Hãy thêm sản phẩm vào giỏ hàng'),
          )
        : Column(
            children: listsGroupsByNameShop.entries.map((entry) {
            final shopName = entry.key;
            final items = entry.value;

            return Column(
              children: [
                HeaderDetailShoppingCart(
                  nameShop: shopName,
                ),
                Column(
                  children: items.map((e) {
                    return ProductShoppingCart(
                      nameShop: shopName,
                      model: e,
                    );
                  }).toList(),
                )
              ],
            );
          }).toList());
  }
}
