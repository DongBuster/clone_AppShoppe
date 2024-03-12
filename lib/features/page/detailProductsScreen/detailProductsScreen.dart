import 'package:clone_shoppe/features/page/detailProductsScreen/view/BannerProducts.dart';
import 'package:clone_shoppe/features/page/detailProductsScreen/view/descriptionProducts.dart';
import 'package:clone_shoppe/features/page/detailProductsScreen/view/footerDetailProducts.dart';
import 'package:clone_shoppe/features/page/detailProductsScreen/view/headerDetailProducts.dart';
import 'package:clone_shoppe/provider/detailProductModel.dart';
import 'package:clone_shoppe/provider/headerDetailProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProductsScreen extends StatefulWidget {
  // final DetailProduct infoProduct;
  // const DetailProductsScreen({super.key, required this.infoProduct});
  const DetailProductsScreen({super.key});

  @override
  State<DetailProductsScreen> createState() => _DetailProductsScreenState();
}

class _DetailProductsScreenState extends State<DetailProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<DetailProductModel>(
        builder: (context, productModel, child) => Stack(
          children: [
            Container(
              color: Colors.black12,
            ),
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.metrics.pixels <= 20 &&
                      notification.metrics.axis == Axis.vertical) {
                    Provider.of<SateHeaderDetailProduct>(context, listen: false)
                        .setNotActiveChangeHeader();
                  } else if (notification.metrics.pixels > 20 &&
                      notification.metrics.axis == Axis.vertical) {
                    Provider.of<SateHeaderDetailProduct>(context, listen: false)
                        .setActiveChangeHeader();
                  }
                });

                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BannerProducts(product: productModel.detailProductModel),
                    DesscriptionProducts(
                      detailProduct: productModel.detailProductModel,
                    ),
                    const SizedBox(height: 62),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HeaderDetailProducts(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: FooterDetailProducts(
                  productModel: productModel.detailProductModel),
            )
          ],
        ),
      ),
    );
  }
}
