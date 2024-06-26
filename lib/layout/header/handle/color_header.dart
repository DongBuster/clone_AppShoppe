import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../features/page/detailProductsPage/view_models/detail_product_provider.dart';
import '../../../features/page/homePage/view_models/home_page_view_model.dart';

// handle colorIconBottomNavBar when go route
Color colorIconHeader(BuildContext context) {
  bool isChangeHeaderDetailProduct =
      Provider.of<DetailProductViewModel>(context, listen: true)
          .state
          .getisChangeHeader;
  if (isChangeHeaderDetailProduct == true &&
      GoRouter.of(context).location == '/home/detailProducts') {
    return Colors.redAccent;
  } else if (isChangeHeaderDetailProduct == false &&
      GoRouter.of(context).location == '/home/detailProducts') {
    return Colors.white;
  }
  if (GoRouter.of(context).location != '/home' ||
      Provider.of<HomePageViewModel>(context, listen: true)
              .state
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
