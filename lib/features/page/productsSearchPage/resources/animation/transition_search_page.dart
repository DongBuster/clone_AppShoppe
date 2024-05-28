import 'package:clone_shoppe/features/page/productsSearchPage/products_search.dart';
import 'package:flutter/material.dart';

Route goRouteProductSearchPage(
  List<dynamic>? listIdProductSelected,
  List<dynamic>? otherSearch,
  String? nameSearch,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProductsSearch(
      listIdProductSelected: listIdProductSelected,
      otherSearch: otherSearch,
      nameSearch: nameSearch,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
