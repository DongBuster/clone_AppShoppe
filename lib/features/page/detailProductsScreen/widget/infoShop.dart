import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:flutter/material.dart';

class InfoShop extends StatelessWidget {
  final DetailProduct detailProduct;

  const InfoShop({super.key, required this.detailProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  imageShop(detailProduct.image[0]),
                  const SizedBox(width: 10),
                  nameShop(detailProduct.nameShop)
                ],
              ),
              buttonInfoShop(),
            ],
          ),
          const SizedBox(height: 12),
          descriptionShop()
        ],
      ),
    );
  }
}

Widget imageShop(String path) {
  return Stack(
    children: [
      SizedBox(
        width: 50,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            path,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        left: 0,
        bottom: 0,
        child: Container(
          alignment: Alignment.center,
          width: 68,
          height: 19,
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
              fontSize: 13,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}

Widget nameShop(String nameShop) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        nameShop,
        style: const TextStyle(fontSize: 14),
      ),
      const Text(
        'Online 2 phút trước',
        style: TextStyle(fontSize: 12, color: Colors.black45),
      ),
      const Text(
        ' Hà Nội',
        style: TextStyle(fontSize: 12, color: Colors.black45),
      ),
    ],
  );
}

Widget buttonInfoShop() {
  return Container(
    alignment: Alignment.center,
    width: 90,
    height: 30,
    decoration: BoxDecoration(
      border: Border.all(color: GloblalVariable.hex_f94f2f, width: 2),
      borderRadius: BorderRadius.circular(3),
    ),
    child: const Text(
      'Xem Shop',
      style: TextStyle(fontSize: 15, color: GloblalVariable.hex_f94f2f),
    ),
  );
}

Widget descriptionShop() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            '91 ',
            style: TextStyle(fontSize: 14, color: GloblalVariable.hex_f94f2f),
          ),
          Text(
            'Sản phẩm',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      SizedBox(width: 12),
      Row(
        children: [
          Text(
            '4.5 ',
            style: TextStyle(fontSize: 14, color: GloblalVariable.hex_f94f2f),
          ),
          Text(
            'Đánh giá',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      SizedBox(width: 12),
      Row(
        children: [
          Text(
            '99% ',
            style: TextStyle(fontSize: 14, color: GloblalVariable.hex_f94f2f),
          ),
          Text(
            'Phản hồi Chat',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ],
  );
}
