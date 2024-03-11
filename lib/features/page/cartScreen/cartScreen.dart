import 'package:clone_shoppe/features/page/cartScreen/handle/renderListProductCart.dart';
import 'package:clone_shoppe/features/page/cartScreen/view/footerCartScreen.dart';
import 'package:clone_shoppe/features/page/cartScreen/view/headerCartScreen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(color: Colors.black12),
          Container(
            margin: const EdgeInsets.only(top: 68, bottom: 55),
            child: const SingleChildScrollView(
              child: RenderListProductCart(),
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
