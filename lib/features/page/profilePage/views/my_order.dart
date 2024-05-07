import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../../../../common/widgets/text.dart';
import '../../../../provider/list_purchase_order.dart';
import '../../purchaseOrderPage/purchase_order.dart';
import '../widgets/feature_link.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    int quantityBoughtProduct =
        Provider.of<ListProductPurchureOder>(context, listen: true)
            .getListProductPurchureOder
            .length;
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          const FeatureLink(
              icon: Icons.vibration,
              colorIcon: Colors.green,
              title: 'Đơn giá và dịch vụ',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          const FeatureLink(
              icon: Icons.event_note,
              colorIcon: Colors.indigoAccent,
              title: 'Đơn mua',
              description: 'Xem lịch sử mua hàng',
              isBorderBottom: true,
              isBorderTop: false),
          Container(
            margin: const EdgeInsets.all(12),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.unarchive_outlined,
                      size: 20,
                      color: Colors.black54,
                    ),
                    Gap(5),
                    Text(
                      'Chờ xác nhận',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PurchaseOrder()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        position:
                            badges.BadgePosition.topStart(top: -12, start: 12),
                        badgeContent: MyText(
                          text: '$quantityBoughtProduct',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.card_giftcard_rounded,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        'Chờ lấy hàng',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 20,
                      color: Colors.black54,
                    ),
                    Gap(5),
                    Text(
                      'Chờ giao hàng',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.stars_outlined,
                      size: 20,
                      color: Colors.black54,
                    ),
                    Gap(5),
                    Text(
                      'Đánh giá',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const FeatureLink(
              icon: Icons.restaurant,
              colorIcon: Colors.red,
              title: 'Đơn ShoppeFood',
              description: '',
              isBorderBottom: false,
              isBorderTop: true),
        ],
      ),
    );
  }
}
