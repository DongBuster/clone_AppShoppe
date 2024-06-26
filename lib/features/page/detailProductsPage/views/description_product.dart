import 'package:clone_shoppe/features/page/detailProductsPage/resources/widget/info_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/resources/widget/info_shop.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/resources/widget/title_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/models/detail_product.dart';
import 'package:flutter/material.dart';

class DesscriptionProducts extends StatefulWidget {
  final DetailProduct detailProduct;
  const DesscriptionProducts({super.key, required this.detailProduct});
  @override
  State<DesscriptionProducts> createState() => _DesscriptionProductsState();
}

class _DesscriptionProductsState extends State<DesscriptionProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleProducts(detailProduct: widget.detailProduct),
        InfoShop(
          detailProduct: widget.detailProduct,
        ),
        const InfoProduct(),
      ],
    );
  }
}
