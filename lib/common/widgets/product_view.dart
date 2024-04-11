// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'FlagSale.dart';
import 'FlagShop.dart';

class ProductView extends StatelessWidget {
  final String urlImage;
  final String name;
  final String price;
  final String quantitySold;
  final String percentSale;
  const ProductView({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.price,
    required this.quantitySold,
    required this.percentSale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.47 + 6,
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: urlImage,
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: 180,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.47,
                        height: 180,
                        color: Colors.black45,
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
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
                              '₫ $price',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14),
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
                                  quantitySold,
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
                ],
              ),
            ),
            Positioned(
              left: 3,
              bottom: 95,
              child: Image.asset(
                'assets/specialBanner.png',
                width: 85,
              ),
            ),
            Positioned(
              top: 0,
              right: 3,
              child: FlagSale(
                type: 2,
                percentSale: percentSale,
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
      ],
    );
  }
}
