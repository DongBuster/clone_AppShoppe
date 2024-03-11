import 'package:clone_shoppe/common/widgets/FlagSale.dart';
import 'package:clone_shoppe/common/widgets/FlagShop.dart';
import 'package:clone_shoppe/models/productSale.dart';
import 'package:flutter/material.dart';

class ProductSaleWidget extends StatefulWidget {
  final ProductSale productSale;
  const ProductSaleWidget({
    super.key,
    required this.productSale,
  });

  @override
  State<ProductSaleWidget> createState() => _ProductSaleWidgetState();
}

class _ProductSaleWidgetState extends State<ProductSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 160,
                child: Image.asset(
                  widget.productSale.image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 5,
                bottom: 0,
                child: Image.asset(
                  'assets/specialBanner.png',
                  width: 85,
                ),
              ),
              Positioned(
                top: 0,
                right: 5,
                child: FlagSale(
                    type: 1, percentSale: widget.productSale.percentSale),
              ),
              const Positioned(
                top: 8,
                left: 0,
                child: FlagShop(
                  typeShop: 1,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: RichText(
              text: TextSpan(
                text: '₫ ',
                style: const TextStyle(color: Colors.red, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: widget.productSale.price,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 130,
                height: 15,
                decoration: BoxDecoration(
                    color: const Color(0xfff8b8a1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: 50,
                height: 15,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
              ),
              Container(
                width: 130,
                alignment: Alignment.center,
                child: const Text('ĐANG BÁN CHẠY',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
