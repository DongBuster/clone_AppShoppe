import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/resources/widgets/check_box.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:clone_shoppe/provider/list_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/selected_product_cart.dart';

class ContentDetailShoppingCart extends StatefulWidget {
  final ProductShoppingCartModel cartModel;
  final String nameShop;

  // bool isChecked;
  const ContentDetailShoppingCart({
    super.key,
    required this.cartModel,
    // required this.isChecked,
    required this.nameShop,
  });

  @override
  State<ContentDetailShoppingCart> createState() =>
      _ContentDetailShoppingCartState();
}

class _ContentDetailShoppingCartState extends State<ContentDetailShoppingCart> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    count = widget.cartModel.numberOfProducts;

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckBox(
                // isChecked: widget.isChecked,
                model: widget.cartModel,
                nameShop: widget.nameShop,
              ),
              const SizedBox(width: 5),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.cartModel.image,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return Container(
                      color: Colors.black45,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cartModel.nameProduct,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    widget.cartModel.classify.isEmpty
                        ? Container()
                        : GestureDetector(
                            onTap: null,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              constraints: const BoxConstraints(
                                maxWidth: 230,
                                minHeight: 25,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 150,
                                    ),
                                    child: Text(
                                      ' Phân loại: ${widget.cartModel.classify.keys.first}',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.black26,
                                  )
                                ],
                              ),
                            ),
                          ),
                    const SizedBox(height: 5),
                    Text(
                      'đ${widget.cartModel.classify.values.first}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: GloblalVariable.hex_f94f2f,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // add quantity of products
                    Container(
                      width: 90,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (count != 1) {
                                setState(() {
                                  count--;
                                });
                                Provider.of<ListProductCart>(context,
                                        listen: false)
                                    .addQuantityProductCart(
                                        count, widget.cartModel);
                                Provider.of<SelectedProductCart>(context,
                                        listen: false)
                                    .setQuanityOfItemsSelected(
                                        count, widget.cartModel);
                              }
                            },
                            child: Container(
                              width: 30,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right:
                                          BorderSide(color: Colors.black12))),
                              alignment: Alignment.topCenter,
                              child: const Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '$count',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                              Provider.of<ListProductCart>(context,
                                      listen: false)
                                  .addQuantityProductCart(
                                      count, widget.cartModel);
                              Provider.of<SelectedProductCart>(context,
                                      listen: false)
                                  .setQuanityOfItemsSelected(
                                      count, widget.cartModel);
                            },
                            child: Container(
                              width: 30,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(color: Colors.black12))),
                              alignment: Alignment.topCenter,
                              child: const Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
