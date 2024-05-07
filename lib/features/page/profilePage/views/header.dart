import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../common/widgets/text.dart';
import '../../../../constants/global_variables.dart';
import '../widgets/icon_shopping_cart.dart';

Color primaryColor = GloblalVariable.hex_f94f2f;

class HeaderProfilePage extends StatefulWidget {
  const HeaderProfilePage({super.key});

  @override
  State<HeaderProfilePage> createState() => _HeaderProfilePageState();
}

class _HeaderProfilePageState extends State<HeaderProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //----- my shop -----
        Container(
          width: 85,
          height: 22,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Row(
            children: [
              const Gap(4),
              Text(
                'Shop của tôi',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(3),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: primaryColor,
              )
            ],
          ),
        ),
        //----  icon header ----
        Row(
          children: [
            GestureDetector(
              onTap: null,
              child: const Icon(
                Icons.settings,
                size: 20,
                color: Colors.white,
              ),
            ),
            const Gap(12),
            GestureDetector(
                onTap: () {
                  context.pushNamed(GloblalVariable.cartScreen);
                },
                child: const IconShoppingCartProfile()),
            const Gap(12),
            GestureDetector(
              child: badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                position: badges.BadgePosition.topStart(top: -12, start: 12),
                badgeContent: const MyText(
                    text: '3',
                    fontSize: 10,
                    fontWeight: null,
                    color: Colors.white),
                child: const Icon(
                  Icons.message_outlined,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
