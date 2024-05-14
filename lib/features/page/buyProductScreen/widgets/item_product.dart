import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../constants/global_variables.dart';
import '../../shoppingCartPage/models/product_shopping_cart_model.dart';
import '../../profilePage/resources/widgets/feature_link.dart';

class ItemProduct extends StatelessWidget {
  final ProductShoppingCartModel model;
  const ItemProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          //--- header ---
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color(0xfff25220),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                  ),
                ),
                child: const Text(
                  'Yêu thích+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const Gap(8),
              Text(
                model.nameShop,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Gap(15),
          //--- Product description ---
          Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: model.image,
                    fit: BoxFit.fill,
                    width: 70,
                    height: 70,
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 70,
                        height: 70,
                        color: Colors.black45,
                      );
                    },
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - (70 + 8 * 3),
                        child: Text(
                          model.nameProduct,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Gap(3),
                      Image.asset(
                        'assets/freereturn.png',
                        width: 65,
                        height: 25,
                      ),
                      Text(
                        'Phân loại: ${model.classify.keys.first}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70 + 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'đ${model.classify.values.first}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'x${model.numberOfProducts}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          //--- line ---
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
          //--- voucher shop ---
          const FeatureLink(
            icon: Icons.confirmation_num_outlined,
            colorIcon: GloblalVariable.hex_f94f2f,
            title: 'Voucher của Shop',
            description: 'Chọn hoặc nhập mã',
            isBorderBottom: false,
            isBorderTop: false,
          ),

          //--- line ---
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.greenAccent,
          ),
          //--- free ship ---
          Container(
            padding: const EdgeInsets.only(left: 5),
            color: const Color(0xfffafdff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(5),
                const Text(
                  'Phương thức vận chuyển (Nhấn để chọn)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff00bfa5),
                  ),
                ),
                //--- line ---
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nhanh',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Gap(12),
                        Text(
                          'Nhận hàng vào 18 Th03 - 20 Th09',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 12,
                              color: Color(0xff00bfa5),
                            ),
                            Gap(3),
                            Text(
                              'Đã áp dụng Mã miễn phí vận chuyển',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff00bfa5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'đ20.000',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              'đ0',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black54,
                        )
                      ],
                    )
                  ],
                ),
                const Gap(5),
              ],
            ),
          ),
          //--- line ---
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.greenAccent,
          ),

          //--- message for shop ---
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tin nhắn: ',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                'Lưu ý cho Người bán...',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          //--- line ---
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
          //--- total price ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng số tiền (${model.numberOfProducts} sản phẩm): ',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                'đ${model.classify.values.first}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: GloblalVariable.hex_f94f2f,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
