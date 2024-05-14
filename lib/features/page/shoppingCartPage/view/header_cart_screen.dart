import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../../../common/widgets/text.dart';
import '../../../../constants/global_variables.dart';
import '../../../../provider/list_product_cart.dart';

class HeaderCartScreen extends StatefulWidget {
  const HeaderCartScreen({super.key});

  @override
  State<HeaderCartScreen> createState() => _HeaderCartScreenState();
}

class _HeaderCartScreenState extends State<HeaderCartScreen> {
  @override
  Widget build(BuildContext context) {
    int coutCart =
        Provider.of<ListProductCart>(context, listen: true).getListItems.length;
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // button back
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 25,
              color: GloblalVariable.hex_f94f2f,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 50),
              const Text(
                'Giỏ hàng',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    decoration: TextDecoration.none),
              ),
              Text(
                '($coutCart)',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
          SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Sửa',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      decoration: TextDecoration.none),
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(GloblalVariable.cartScreen);
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topStart(
                      top: -15,
                      start: 14,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                        borderSide: BorderSide(color: Colors.white)),
                    badgeContent: const MyText(
                      text: '33',
                      fontSize: 10,
                      fontWeight: null,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.chat,
                      size: 28,
                      color: GloblalVariable.hex_f94f2f,
                    ),
                  ),
                ),
                //
              ],
            ),
          )
        ],
      ),
    );
  }
}
