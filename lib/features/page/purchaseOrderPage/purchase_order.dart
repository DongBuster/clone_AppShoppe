import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../provider/list_purchase_order.dart';

class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage({super.key});

  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  @override
  Widget build(BuildContext context) {
    int quantityBoughtProduct =
        Provider.of<ListProductPurchureOder>(context, listen: true)
            .getListProductPurchureOder
            .length;

    List<ProductShoppingCartModel> listProducts =
        Provider.of<ListProductPurchureOder>(context, listen: true)
            .getListProductPurchureOder;
    // print(listProducts);
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 18,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Đơn mua',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 20,
              color: GloblalVariable.hex_f94f2f,
            ),
            Gap(10),
            Icon(
              Icons.message_outlined,
              size: 20,
              color: GloblalVariable.hex_f94f2f,
            ),
            Gap(15),
          ],
          bottom: const TabBar(
            labelColor: GloblalVariable.hex_f94f2f,
            indicatorColor: GloblalVariable.hex_f94f2f,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: GloblalVariable.hex_f94f2f,
              ),
            ),
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(
                text: 'Chờ xác\n   nhận',
              ),
              Tab(
                text: 'Chờ lấy\n   hàng',
              ),
              Tab(
                text: 'Chờ giao\n   hàng',
              ),
              Tab(
                text: 'Đã giao',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(),
            Stack(
              children: [
                Container(color: Colors.black12),
                ListView.builder(
                  itemCount: quantityBoughtProduct,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemProduct(
                      model: listProducts[index],
                    );
                  },
                ),
              ],
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              const Text(
                'Vận chuyển',
                style: TextStyle(
                  fontSize: 12,
                  color: GloblalVariable.hex_f94f2f,
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
            margin: const EdgeInsets.only(top: 8),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
          const Gap(10),

          //--- total price ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thành tiền: ',
                style: TextStyle(
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
