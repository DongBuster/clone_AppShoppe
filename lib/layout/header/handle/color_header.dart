import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../provider/header_detail_product.dart';
import '../../../features/page/homePage/provider/home_page_state.dart';

// handle colorIconBottomNavBar when go route
Color colorIconHeader(BuildContext context) {
  bool isChangeHeaderDetailProduct =
      Provider.of<SateHeaderDetailProduct>(context, listen: false)
          .getIsChangeHeader;
  if (isChangeHeaderDetailProduct == true &&
      GoRouter.of(context).location == '/home/detailProducts') {
    return Colors.redAccent;
  } else if (isChangeHeaderDetailProduct == false &&
      GoRouter.of(context).location == '/home/detailProducts') {
    return Colors.white;
  }
  if (GoRouter.of(context).location != '/home' ||
      Provider.of<HomePageState>(context, listen: true)
              .getState
              .activeIconHeader ==
          true) {
    return Colors.redAccent;
  } else {
    return Colors.white;
  }
}

// handle background header when go route and route location == home
Color backgroundHeader(BuildContext context, bool isActiveColorIcon) {
  if (GoRouter.of(context).location == '/mallScreen') {
    return Colors.white;
  } else if (GoRouter.of(context).location == '/home' && isActiveColorIcon) {
    return Colors.white;
  } else {
    return Colors.transparent;
  }
}
