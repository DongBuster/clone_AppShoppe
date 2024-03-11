import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../layout/header/handle/colorHeader.dart';
import '../../provider/listProductCart.dart';
import 'text.dart';

class IconShoppingCart extends StatefulWidget {
  const IconShoppingCart({super.key});

  @override
  State<IconShoppingCart> createState() => _IconShoppingCartState();
}

class _IconShoppingCartState extends State<IconShoppingCart> {
  @override
  Widget build(BuildContext context) {
    int numberCart = Provider.of<ListProductCart>(context, listen: true)
        .getlistsGroupsByNameShop
        .length;
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      position: badges.BadgePosition.topStart(top: -15, start: 14),
      badgeContent: MyText(
        text: '$numberCart',
        fontSize: null,
        fontWeight: null,
        color: Colors.white,
      ),
      child: Icon(
        Icons.shopping_cart_outlined,
        size: 28,
        color: colorIconHeader(context),
      ),
    );
  }
}
