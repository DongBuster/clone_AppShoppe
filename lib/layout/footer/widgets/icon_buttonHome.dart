import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../animations/rotation_icon_footer.dart';
import '../../../features/page/homePage/view_models/home_page_view_model.dart';
import '../handles/handle_footer.dart';

class IconButtonHome extends StatelessWidget {
  final double size;
  final String pathRoute;
  const IconButtonHome(
      {super.key, required this.size, required this.pathRoute});

  @override
  Widget build(BuildContext context) {
    bool isActiveIconHome =
        Provider.of<HomePageViewModel>(context, listen: true)
            .state
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
