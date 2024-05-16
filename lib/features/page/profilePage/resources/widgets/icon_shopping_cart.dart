import 'package:clone_shoppe/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../../../shoppingCartPage/view_models/state_cart_page.dart';

class IconShoppingCartProfile extends StatefulWidget {
  const IconShoppingCartProfile({super.key});

  @override
  State<IconShoppingCartProfile> createState() =>
      _IconShoppingCartProfileState();
}

class _IconShoppingCartProfileState extends State<IconShoppingCartProfile> {
  @override
  Widget build(BuildContext context) {
    int numberCart = Provider.of<CartPageViewModel>(context, listen: true)
        .stateCartPage
        .listProductShoppingCart
        .length;
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      position: badges.BadgePosition.topStart(top: -12, start: 10),
      badgeContent: MyText(
        text: '$numberCart',
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      child: const Icon(
        Icons.shopping_cart_outlined,
        size: 22,
        color: Colors.white,
      ),
    );
  }
}
