import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/detail_product.dart';
import 'package:clone_shoppe/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/product_view.dart';
import '../../detailProductsPage/provider/detail_product_provider.dart';

class ProductRecommend extends StatefulWidget {
  final Product productsRecommend;
  const ProductRecommend({
    super.key,
    required this.productsRecommend,
  });

  @override
  State<ProductRecommend> createState() => _ProductRecommendState();
}

class _ProductRecommendState extends State<ProductRecommend> {
  @override
  Widget build(BuildContext context) {
    final detailProduct = DetailProduct(
      image: widget.productsRecommend.image,
      classify: widget.productsRecommend.classify,
      name: widget.productsRecommend.name,
      nameShop: widget.productsRecommend.nameShop,
      percentSale: widget.productsRecommend.percentSale,
      quantitySold: widget.productsRecommend.quantitySold,
    );
    return GestureDetector(
        onTap: () {
          Provider.of<StateDetailProduct>(context, listen: false)
              .getStateDetailProduct
              .setIdProduct = widget.productsRecommend.id;
          context.pushNamed(GloblalVariable.detailProducts);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => DetailProductsScreen(
          //             idProduct: widget.productsRecommend.id)));
        },
        child: ProductView(
          urlImage: detailProduct.image[0],
          name: detailProduct.name,
          price: detailProduct.classify.values.first,
          percentSale: detailProduct.percentSale,
          quantitySold: detailProduct.quantitySold,
        ));
  }
}
