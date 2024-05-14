import 'package:clone_shoppe/features/page/shoppingCartPage/view/list_product_shopping_cart.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/view/footer_cart_screen.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/view/header_cart_screen.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black12),
          Container(
            margin: const EdgeInsets.only(top: 68, bottom: 55),
            child: const SingleChildScrollView(
              child: ListProductShoppingCart(),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderCartScreen(),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FooterCartScreen(),
          ),
        ],
      ),
    );
  }
}
