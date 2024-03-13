import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/cartModel.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:clone_shoppe/provider/checkboxCartScreen.dart';
import 'package:clone_shoppe/provider/listProductCart.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ModalBottomSheet extends StatefulWidget {
  final DetailProduct model;
  const ModalBottomSheet({super.key, required this.model});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  late CartModel productCart;

  //----- -----
  String valueSlected = '';
  late List<bool> isBorderList;
  late List<String> listKeyClassify;
  int count = 1;
  int indexImage = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    isBorderList = List.generate(widget.model.classify.length, (_) => false);
    isBorderList.first = true;
    listKeyClassify = widget.model.classify.keys.toList();
    valueSlected = widget.model.classify.keys.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(productCart.classify[productCart.classify.keys.first]);
    productCart = CartModel(
      nameProduct: widget.model.name,
      nameShop: widget.model.nameShop,
      image: widget.model.image,
      classify: widget.model.classify,
      numberOfProducts: 0,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(productCart.image[indexImage]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      children: [
                        Text(
                          'đ${productCart.classify[productCart.classify.keys.first]}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: GloblalVariable.hex_f94f2f,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Kho: 12734',
                          style: TextStyle(
                            fontSize: 16,
                            color: GloblalVariable.hex_9c9c9c,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //--- buttom close modalbottomsheet ---
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                    color: GloblalVariable.hex_9c9c9c,
                  ),
                )
              ],
            ),
          ),

          productCart.classify.isEmpty
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 12),
                      child: const Text(
                        'Phân loại',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Wrap(
                      children: listKeyClassify.asMap().entries.map((entry) {
                        final index = entry.key;
                        final value = entry.value;

                        return GestureDetector(
                          onTap: () => setState(() {
                            for (int i = 0; i < isBorderList.length; i++) {
                              isBorderList[i] =
                                  (i == index) ? !isBorderList[i] : false;
                            }
                            if (isBorderList[index]) {
                              indexImage = index;
                              valueSlected = value;
                            } else {
                              valueSlected = '';
                            }
                            productCart.classify = {
                              valueSlected: productCart.classify[valueSlected]
                            };

                            // print(valueSlected);
                          }),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            height: 30,
                            constraints: const BoxConstraints(
                              minWidth: 60,
                              maxWidth: 200,
                            ),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: isBorderList[index]
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.1),
                              border: isBorderList[index]
                                  ? Border.all(
                                      color: GloblalVariable.hex_f94f2f)
                                  : null,
                            ),
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
          // line
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
            ),
          ),
          //add quantity of products
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Số lượng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  ),
                ),
                Container(
                  width: 100,
                  height: 28,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Row(
                    children: [
                      // add quantity
                      GestureDetector(
                        onTap: () {
                          if (count != 1) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: Container(
                          width: 30,
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.black12))),
                          alignment: Alignment.topCenter,
                          child: const Text(
                            '-',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      // number quantity
                      Expanded(
                        child: Center(
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      // minus quantity
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            count++;
                          });
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //button add product
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 2,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  productCart.numberOfProducts = count;
                  productCart.classify = {
                    valueSlected: productCart.classify[valueSlected]
                  };
                  productCart.image = [productCart.image[indexImage]];

                  Provider.of<ListProductCart>(context, listen: false)
                      .addProductToCart(productCart);
                  var listsGroupsByNameShop =
                      Provider.of<ListProductCart>(context, listen: false)
                          .listsGroupsByNameShop;
                  Provider.of<CheckBoxCartScreen>(context, listen: false)
                      .addItemsCheckbox(listsGroupsByNameShop);
                });

                //------- -------

                //----- -----
                // if (context.mounted) {
                //   context.pop();
                // }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 20,
                height: 35,
                decoration: BoxDecoration(
                  color: valueSlected != '' || productCart.classify.isEmpty
                      ? GloblalVariable.hex_f94f2f
                      : Colors.black12,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  'Thêm vào giỏ hàng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: valueSlected != '' || productCart.classify.isEmpty
                        ? Colors.white
                        : Colors.black38,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
