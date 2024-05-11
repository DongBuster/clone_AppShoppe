import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/cartPage/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../common/widgets/icon_shopping_cart.dart';
import '../../common/widgets/text.dart';
import '../../features/page/homePage/provider/home_page_state.dart';
import 'handle/color_header.dart';

class HeaderApp extends StatefulWidget {
  final Widget child;
  const HeaderApp({super.key, required this.child});

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  @override
  Widget build(BuildContext context) {
    bool isActiveColorIcon = Provider.of<HomePageState>(context, listen: true)
        .getState
        .activeIconHeader;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
      // height: 65,
      color: backgroundHeader(context, isActiveColorIcon),

      child: Row(
        children: [
          Expanded(child: widget.child),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //icon shopping cart
                GestureDetector(
                    onTap: () {
                      context.pushNamed(GloblalVariable.cartScreen);
                    },
                    child: const IconShoppingCart()),
                // icon message
                GestureDetector(
                  child: badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    position:
                        badges.BadgePosition.topStart(top: -12, start: 12),
                    badgeContent: const MyText(
                        text: '3',
                        fontSize: 10,
                        fontWeight: null,
                        color: Colors.white),
                    child: Icon(
                      Icons.message_outlined,
                      size: 22,
                      color: colorIconHeader(context),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
