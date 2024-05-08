import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void onTapIconFooter(BuildContext context, String nameRoute) {
  context.pushNamed(nameRoute);
}

Color colorCurrentRoute(BuildContext context, String pathRoute) {
  if (GoRouter.of(context).location == pathRoute) {
    return Colors.redAccent;
  } else {
    return Colors.black45;
  }
}
