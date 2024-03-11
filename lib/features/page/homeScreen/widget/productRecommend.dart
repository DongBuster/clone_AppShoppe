import 'package:clone_shoppe/common/widgets/FlagSale.dart';
import 'package:clone_shoppe/common/widgets/FlagShop.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:clone_shoppe/models/productsRecommend.dart';
import 'package:clone_shoppe/provider/detailProductModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductRecommend extends StatefulWidget {
  final ProductsRecommend productsRecommend;
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
    // print(widget.productsRecommend.classify.runtimeType);
    // print(widget.productsRecommend.classify[0].values.first);
    return GestureDetector(
      onTap: () {
        Provider.of<DetailProductModel>(context, listen: false)
            .setValueDetailProductModel(detailProduct);
        context.pushNamed(GloblalVariable.detailProducts);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Image.asset(
                  widget.productsRecommend.image[0],
                  width: 193,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 2,
                bottom: 0,
                child: Image.asset(
                  'assets/specialBanner.png',
                  width: 85,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: FlagSale(
                  type: 2,
                  percentSale: widget.productsRecommend.percentSale,
                ),
              ),
              const Positioned(
                top: 4,
                left: 0,
                child: FlagShop(
                  typeShop: 1,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(7),
              color: Colors.white,
              width: 193,
              height: 95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productsRecommend.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₫ ${widget.productsRecommend.classify.values.first}',
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Đã bán',
                            style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            widget.productsRecommend.quantitySold,
                            style: const TextStyle(
                              color: Color(0xff757575),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
