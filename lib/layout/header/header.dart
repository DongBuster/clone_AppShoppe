import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/IconShoppingCart.dart';
import '../../common/widgets/text.dart';
import '../../constants/global_variables.dart';
import '../../provider/stateActiveColorIconHeader.dart';
import 'handle/colorHeader.dart';

class HeaderApp extends StatefulWidget {
  final Widget child;
  const HeaderApp({super.key, required this.child});

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  @override
  Widget build(BuildContext context) {
    bool isActiveColorIcon =
        Provider.of<StateActiveColorIconHeader>(context, listen: true)
            .isActiveColorIcon;
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
                        badges.BadgePosition.topStart(top: -15, start: 14),
                    badgeContent: const MyText(
                        text: '3',
                        fontSize: null,
                        fontWeight: null,
                        color: Colors.white),
                    child: Icon(
                      Icons.message_outlined,
                      size: 28,
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
