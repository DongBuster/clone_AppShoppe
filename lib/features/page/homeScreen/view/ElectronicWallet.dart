import 'package:flutter/material.dart';

class ElectronicWallet extends StatelessWidget {
  const ElectronicWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          const Icon(Icons.qr_code_scanner_outlined, color: Colors.black54),
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 1,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopify_outlined,
                      color: Colors.redAccent,
                    ),
                    Text(
                      'Ví ShopeePay',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Voucher giảm đến 40.000Đ',
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xff757575),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 1,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.orange,
                    ),
                    Text(
                      '0',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  'Đổi xu lấy mã giảm giá',
                  // overflow: Texto,
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
