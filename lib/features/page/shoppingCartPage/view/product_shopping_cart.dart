import 'package:flutter/material.dart';

import '../models/product_shopping_cart_model.dart';
import '../resources/widgets/fix_shopping_cart.dart';
import '../resources/widgets/content_detail_shopping_cart.dart';

class ProductShoppingCart extends StatefulWidget {
  final ProductShoppingCartModel model;
  final String nameShop;
  // bool isChecked;
  const ProductShoppingCart({
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
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
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
