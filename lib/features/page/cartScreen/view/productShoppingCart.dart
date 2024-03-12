import 'package:flutter/material.dart';

import '../../../../models/cartModel.dart';
import '../handle/fixShoppingCart.dart';
import '../widget/contentDetailShoppingCart.dart';

class ProductShoppingCart extends StatefulWidget {
  final CartModel model;
  final String nameShop;
  // bool isChecked;
  ProductShoppingCart({
    super.key,
    required this.model,
    // required this.isChecked,
    required this.nameShop,
  });

  @override
  State<ProductShoppingCart> createState() => _ProductShoppingCartState();
}

class _ProductShoppingCartState extends State<ProductShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        children: [
          FixShoppingCart(
            model: widget.model,
            child: ContentDetailShoppingCart(
              cartModel: widget.model,
              // isChecked: widget.isChecked,
              nameShop: widget.nameShop,
            ),
          ),
        ],
      ),
    );
  }
}
