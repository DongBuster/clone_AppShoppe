import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/checkboxCartScreen.dart';
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
    // var listsCheckBoxByShop =
    //     Provider.of<CheckBoxCartScreen>(context, listen: true)
    //         .listsCheckBoxByShop;

    // print(listsGroupsByNameShop.values);
    // print('ccc${listsCheckBoxByShop.length}');
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
            // Map<String, bool> childCheckBox = listsCheckBoxByShop[shopName]!;
            // print(childCheckBox);
            // print(items.map((e) => childCheckBox[e.classify.values]));
            // print('child${items.first.nameShop}');

            // print(items.first.classify);
            // bool isChecked = childCheckBox[e.classify[0]];
            return Column(
              children: [
                HeaderDetailShoppingCart(
                  nameShop: shopName,
                  // isCheck: isCheckShop[shopName]!,
                ),
                Column(
                  children: items.map((e) {
                    // print(e.classify.keys.first);
                    return ProductShoppingCart(
                      nameShop: shopName,
                      model: e,
                      // isChecked: childCheckBox[e.classify.keys.first]!,
                    );
                  }).toList(),
                )
              ],
            );
          }).toList());
  }
}
