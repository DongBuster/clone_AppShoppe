import 'package:clone_shoppe/features/page/detailProductsPage/view/banner_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/view/description_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/view/footerdetail_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/view/headerdetail_product.dart';
import 'package:clone_shoppe/provider/detail_product_model.dart';
import 'package:clone_shoppe/provider/header_detail_product.dart';
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
                    const SizedBox(height: 50),
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
