import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../provider/selectedProductCart.dart';
import '../profileScreen/feature_link.dart';

class BuyProductScreen extends StatefulWidget {
  const BuyProductScreen({super.key});

  @override
  State<BuyProductScreen> createState() => _BuyProductScreenState();
}

class _BuyProductScreenState extends State<BuyProductScreen> {
  bool isUseCoin = false;
  @override
  Widget build(BuildContext context) {
    List<CartModel> listSelected =
        Provider.of<SelectedProductCart>(context, listen: false)
            .getListSelected;
    String totalPrice =
        Provider.of<SelectedProductCart>(context, listen: false).getTotalPrice;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Thanh toán',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        actions: const [SizedBox(width: 50)],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black12,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Gap(5),
                //--- pickup address ---
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 12),
                      // height: 90,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: GloblalVariable.hex_f94f2f,
                              ),
                              Gap(10),
                              Text(
                                'Địa chỉ nhận hàng',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trịnh Đông | 84 393924128',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '11 Ngách 66 Ngõ 112 Nguyên Xá ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Phường Minh Khai, Quận Bắc Từ Liêm, Hà Nội',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset('assets/border.png',
                        width: MediaQuery.of(context).size.width)
                  ],
                ),
                //--- list product ---
                Column(
                    children: listSelected
                        .map((e) => ItemProduct(model: e))
                        .toList()),

                const Gap(5),
                //---  ---
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    children: [
                      //--- voucher ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.confirmation_num_outlined,
                                size: 15,
                                color: GloblalVariable.hex_f94f2f,
                              ),
                              Gap(5),
                              Text(
                                'Shoppe Voucher',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/freeship.png',
                                width: 90,
                                height: 25,
                              ),
                              const Gap(8),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ],
                      ),
                      //--- line ---
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.black12,
                      ),
                      //---use coin ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.monetization_on_outlined,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              Gap(5),
                              Text(
                                'Dùng 800 Shoppe xu',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 38,
                            height: 25,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: CupertinoSwitch(
                                // This bool value toggles the switch.
                                value: isUseCoin,
                                activeColor: GloblalVariable.hex_f94f2f,
                                onChanged: (bool? value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    isUseCoin = value ?? false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                //--- payment methods ---
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.money,
                                size: 15,
                                color: GloblalVariable.hex_f94f2f,
                              ),
                              Gap(5),
                              Text(
                                'Phương thức thanh toán',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Thanh toán khi nhận hàng',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(8),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ],
                      ),
                      //--- description ---
                      Container(
                        height: 25,
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade500),
                          color: Colors.yellow.shade50,
                        ),
                        child: Center(
                          child: Text(
                            'Dùng ShoppePay để tận hưởng nhiều voucher ưu đãi',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.yellow.shade800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                //--- payment details ---
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 18,
                            color: Colors.yellow.shade800,
                          ),
                          const Gap(5),
                          const Text(
                            'Chi tiết thanh toán',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tổng tiền hàng',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'đ$totalPrice',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng tiền phí vận chuyển',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          Gap(5),
                          Text(
                            'đ20.000',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giảm giá phí vận chuyển',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          Gap(5),
                          Text(
                            '- đ20.000',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'đ$totalPrice',
                            style: const TextStyle(
                              fontSize: 15,
                              color: GloblalVariable.hex_f94f2f,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                //--- rules ---
                Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(
                        Icons.library_books_outlined,
                        size: 18,
                        color: Colors.yellow.shade800,
                      ),
                      const Gap(8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nhấn "Đặt hàng" đồng nghĩa vớ việc bạn đồng ý tuân ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'theo ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'điều khoản của chúng tôi.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(20),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Text(
                  'Tổng thanh toán',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const Gap(3),
                Text(
                  'đ$totalPrice',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: GloblalVariable.hex_f94f2f,
                  ),
                ),
              ],
            ),
            const Gap(10),
            GestureDetector(
              onTap: null,
              child: Container(
                width: 100,
                color: GloblalVariable.hex_f94f2f,
                child: const Center(
                  child: Text(
                    'Đặt hàng',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final CartModel model;
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
                  Image.asset(
                    model.image,
                    width: 70,
                    height: 70,
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
