import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:clone_shoppe/models/product.dart';
import 'package:clone_shoppe/provider/detailProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/product_view.dart';

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
    // print('image: ${widget.productsRecommend.image}');
    // print('classify: ${widget.productsRecommend.classify}');
    final detailProduct = DetailProduct(
      image: widget.productsRecommend.image,
      classify: widget.productsRecommend.classify,
      name: widget.productsRecommend.name,
      nameShop: widget.productsRecommend.nameShop,
      percentSale: widget.productsRecommend.percentSale,
      quantitySold: widget.productsRecommend.quantitySold,
    );
    // print(detailProduct.image.length);
    // print(widget.productsRecommend.classify.runtimeType);
    // print(widget.productsRecommend.classify[0].values.first);
    return GestureDetector(
        onTap: () {
          Provider.of<DetailProductModel>(context, listen: false)
              .setValueDetailProductModel(detailProduct);
          context.pushNamed(GloblalVariable.detailProducts);
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
