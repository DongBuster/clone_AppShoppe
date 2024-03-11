import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../animations/RotationIconFooter.dart';
import '../../../provider/stateActiveIconHome.dart';
import '../handles/handleFooter.dart';

class IconButtonHome extends StatelessWidget {
  final double size;
  final String pathRoute;
  const IconButtonHome(
      {super.key, required this.size, required this.pathRoute});

  @override
  Widget build(BuildContext context) {
    bool isActiveIconHome =
        Provider.of<StateActiveIconHome>(context, listen: true)
            .isActiveIconHome;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GoRouter.of(context).location == '/home'
            ? RotationIconFooter(
                color: colorCurrentRoute(context, pathRoute),
                isChangeIcon: isActiveIconHome,
              )
            : Icon(
                Icons.home,
                size: size,
                color: colorCurrentRoute(context, pathRoute),
              ),
        Text(
          GoRouter.of(context).location == '/home' && isActiveIconHome == false
              ? 'Gợi ý hôm nay'
              : 'Home',
          style: TextStyle(
            fontSize: 12,
            color: colorCurrentRoute(context, pathRoute),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
