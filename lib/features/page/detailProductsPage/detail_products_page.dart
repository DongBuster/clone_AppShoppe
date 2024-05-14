import 'package:clone_shoppe/common/screens/loading_screen.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/views/banner_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/views/description_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/views/footerdetail_product.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/views/headerdetail_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_sources/service.dart';
import 'view_models/detail_product_provider.dart';

class DetailProductsPage extends StatefulWidget {
  const DetailProductsPage({super.key});

  @override
  State<DetailProductsPage> createState() => _DetailProductsPageState();
}

class _DetailProductsPageState extends State<DetailProductsPage> {
  final controller = DetailProductService();

  @override
  Widget build(BuildContext context) {
    int idProduct = Provider.of<DetailProductViewModel>(context, listen: false)
        .state
        .getidProduct;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: controller.getProducts(idProduct),
          builder: (context, snapshot) {
            final product = snapshot.data;
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    color: Colors.black12,
                  ),
                  NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      setState(() {
                        Provider.of<DetailProductViewModel>(context,
                                listen: false)
                            .setIsChangeHeader(notification);
                      });

                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BannerProducts(product: product!),
                          DesscriptionProducts(
                            detailProduct: product,
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
                    child: FooterDetailProducts(productModel: product),
                  )
                ],
              );
            }
            return const ThreeBallIndicator();
          },
        ));
  }
}
