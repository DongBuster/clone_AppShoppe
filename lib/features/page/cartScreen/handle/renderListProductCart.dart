import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/listProductCart.dart';
import '../view/productShoppingCart.dart';
import '../widget/headerDetailShoppingCart.dart';

class RenderListProductCart extends StatefulWidget {
  const RenderListProductCart({super.key});

  @override
  State<RenderListProductCart> createState() => _RenderListProductCartState();
}

class _RenderListProductCartState extends State<RenderListProductCart> {
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
            child: const Text('Hãy thêm sản phẩm vào giỏ hàng'))
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
