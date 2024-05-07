import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../animations/RotationIconFooter.dart';
import '../../../features/page/homePage/provider/home_page_state.dart';
import '../handles/handleFooter.dart';

class IconButtonHome extends StatelessWidget {
  final double size;
  final String pathRoute;
  const IconButtonHome(
      {super.key, required this.size, required this.pathRoute});

  @override
  Widget build(BuildContext context) {
    bool isActiveIconHome = Provider.of<HomePageState>(context, listen: true)
        .getState
        .activeIconHomeFooter;
    // print(isActiveIconHome);
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
          GoRouter.of(context).location == '/home' && isActiveIconHome == true
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
