import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/view/modalBottomSheet.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const stringSvgMessage =
    '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g clip-path="url(#clip0_8_53)"> <path d="M16 12C15.87 12.0016 15.7409 11.9778 15.62 11.93C15.4971 11.8781 15.3852 11.8035 15.29 11.7101C15.2001 11.6179 15.1287 11.5092 15.08 11.39C15.0296 11.266 15.0025 11.1338 15 11C15.0011 10.7376 15.1053 10.4863 15.29 10.3C15.3825 10.2033 15.4952 10.1282 15.62 10.0801C15.8031 10.0047 16.0044 9.98535 16.1984 10.0245C16.3924 10.0637 16.5705 10.1596 16.71 10.3C16.8947 10.4863 16.9989 10.7376 17 11C16.9975 11.1338 16.9704 11.266 16.92 11.39C16.8713 11.5092 16.7999 11.6179 16.71 11.7101C16.6166 11.8027 16.5057 11.876 16.3839 11.9258C16.2621 11.9755 16.1316 12.0007 16 12Z" fill="#ffffff"></path> <path d="M12 12C11.87 12.0016 11.7409 11.9778 11.62 11.93C11.4971 11.8781 11.3852 11.8035 11.29 11.7101C11.2001 11.6179 11.1287 11.5092 11.08 11.39C11.0296 11.266 11.0025 11.1338 11 11C11.0011 10.7376 11.1053 10.4863 11.29 10.3C11.3825 10.2033 11.4952 10.1282 11.62 10.0801C11.8031 10.0047 12.0044 9.98535 12.1984 10.0245C12.3924 10.0637 12.5705 10.1596 12.71 10.3C12.8947 10.4863 12.9989 10.7376 13 11C12.9975 11.1338 12.9704 11.266 12.92 11.39C12.8713 11.5092 12.7999 11.6179 12.71 11.7101C12.6166 11.8027 12.5057 11.876 12.3839 11.9258C12.2621 11.9755 12.1316 12.0007 12 12Z" fill="#ffffff"></path> <path d="M8 12C7.86999 12.0016 7.74091 11.9778 7.62 11.93C7.49713 11.8781 7.38519 11.8035 7.29001 11.7101C7.20006 11.6179 7.12873 11.5092 7.07999 11.39C7.0296 11.266 7.0025 11.1338 7 11C7.0011 10.7376 7.10526 10.4863 7.29001 10.3C7.3825 10.2033 7.49516 10.1282 7.62 10.0801C7.80305 10.0047 8.00435 9.98535 8.19839 10.0245C8.39244 10.0637 8.57048 10.1596 8.70999 10.3C8.89474 10.4863 8.9989 10.7376 9 11C8.9975 11.1338 8.9704 11.266 8.92001 11.39C8.87127 11.5092 8.79994 11.6179 8.70999 11.7101C8.61655 11.8027 8.50575 11.876 8.38391 11.9258C8.26207 11.9755 8.13161 12.0007 8 12Z" fill="#ffffff"></path> </g> <path d="M4.99951 16.55V19.9C4.99922 20.3102 5.11905 20.7114 5.34418 21.0542C5.56931 21.397 5.88994 21.6665 6.26642 21.8292C6.6429 21.9919 7.05875 22.0408 7.46271 21.9698C7.86666 21.8989 8.24103 21.7113 8.53955 21.4301L11.1495 18.9701H12.0195C17.5395 18.9701 22.0195 15.1701 22.0195 10.4701C22.0195 5.77009 17.5395 1.97009 12.0195 1.97009C6.49953 1.97009 2.01953 5.78009 2.01953 10.4701C2.042 11.6389 2.32261 12.7882 2.84125 13.8358C3.35989 14.8835 4.10373 15.8035 5.01953 16.53L4.99951 16.55Z" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <defs> <clipPath id="clip0_8_53"> <rect width="10" height="2" fill="white" transform="translate(7 10)"></rect> </clipPath> </defs> </g></svg>
''';

class FooterDetailProducts extends StatefulWidget {
  final DetailProduct productModel;
  const FooterDetailProducts({super.key, required this.productModel});

  @override
  State<FooterDetailProducts> createState() => _FooterDetailProductsState();
}

class _FooterDetailProductsState extends State<FooterDetailProducts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              width: 100,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.string(
                    stringSvgMessage,
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Chat ngay',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.black.withOpacity(0.1),
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                  ),
                ),
                context: context,
                builder: (context) =>
                    ModalBottomSheet(model: widget.productModel),
              );
            },
            child: Container(
              width: 130,
              color: Colors.green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1,
                    height: 35,
                    color: Colors.black26,
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Thêm vào giỏ hàng',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: GloblalVariable.hex_f94f2f,
                child: const Text(
                  'Mua với voucher',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
