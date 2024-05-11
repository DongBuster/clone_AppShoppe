import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/cart_model.dart';
import 'package:clone_shoppe/models/detail_product.dart';
import 'package:clone_shoppe/provider/checkbox_cart_screen.dart';
import 'package:clone_shoppe/provider/list_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/animation_add_product_tocart.dart';

final productAnimation = 1.seconds;

class ModalBottomSheet extends StatefulWidget {
  final DetailProduct model;
  const ModalBottomSheet({super.key, required this.model});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet>
    with TickerProviderStateMixin {
  late CartModel productCart;
  //----- -----
  String valueSlected = '';
  late List<bool> isBorderList;
  late List<String> listKeyClassify;
  int count = 1;
  int indexImage = 0;
  //------
  late final controller = AnimationController(vsync: this);
  late final cartController = AnimationController(vsync: this);
  late final manager = AddToCartMannager(controller);

  @override
  void dispose() {
    controller.dispose();
    manager.dispose();
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
    // print(productCart.classify.isEmpty);
    productCart = CartModel(
      id: 0,
      nameProduct: widget.model.name,
      nameShop: widget.model.nameShop,
      image: '',
      classify: {},
      numberOfProducts: 0,
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // fake iconbutton shoping cart
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: MediaQuery.of(context).size.width / 1.6,
                ),
                child: SizedBox(
                  key: manager.cartKey,
                  width: 10,
                  height: 10,
                ).animate(
                  controller: cartController,
                  autoPlay: false,
                  onComplete: (controller) {
                    controller.reset();
                  },
                ),
              ),
              // content
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
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
                          // information product
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                key: manager.productKeys[indexImage],
                                width: 100,
                                height: 100,
                                child: CachedNetworkImage(
                                  imageUrl: widget.model.image[indexImage],
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      color: Colors.black45,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 14),
                              Column(
                                children: [
                                  Text(
                                    'đ${widget.model.classify.values.first}',
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
                    // ------ classify product  ------
                    widget.model.classify.isEmpty
                        ? Container()
                        : ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 200),
                            child: SingleChildScrollView(
                              child: Column(
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
                                    spacing: 5,
                                    children: listKeyClassify
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      final index = entry.key;
                                      final value = entry.value;

                                      return Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        child: FilterChip(
                                          padding: const EdgeInsets.all(5),
                                          backgroundColor: Colors.grey.shade200,
                                          side: BorderSide.none,
                                          checkmarkColor:
                                              GloblalVariable.hex_f94f2f,
                                          selectedColor: GloblalVariable
                                              .hex_f94f2f
                                              .withOpacity(0.2),
                                          selected: isBorderList[index],
                                          label: Text(
                                            value,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          onSelected: (selected) {
                                            setState(() {
                                              isBorderList[index] = selected;
                                              if (isBorderList[index]) {
                                                for (int i = 0;
                                                    i < isBorderList.length;
                                                    i++) {
                                                  if (i != index) {
                                                    isBorderList[i] = false;
                                                  }
                                                }
                                                indexImage = index;
                                                valueSlected = value;
                                                productCart.classify = {
                                                  valueSlected: productCart
                                                      .classify[valueSlected]
                                                };
                                              } else {
                                                valueSlected = '';
                                              }
                                            });
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  // line
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 8, bottom: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                    ),
                                  ),
                                  //add quantity of products
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 0, 12, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          width: 90,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12),
                                          ),
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
                                                          right: BorderSide(
                                                              color: Colors
                                                                  .black12))),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: const Text(
                                                    '-',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          left: BorderSide(
                                                              color: Colors
                                                                  .black12))),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                ],
                              ),
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
                          if (valueSlected == '') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Bạn chưa chọn sản phẩm'),
                              backgroundColor: Colors.black.withOpacity(0.5),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height / 2,
                                right: 80,
                                left: 80,
                              ),
                            ));
                            // showSnackBar(context, 'Bạn chưa chọn sản phẩm');
                          } else {
                            manager.runAnimation(indexImage);

                            setState(() {
                              productCart.numberOfProducts = count;
                              productCart.classify = {
                                valueSlected:
                                    widget.model.classify[valueSlected]
                              };
                              // print(widget.model.image[indexImage]);
                              productCart.image =
                                  widget.model.image[indexImage];

                              Provider.of<ListProductCart>(context,
                                      listen: false)
                                  .addProductToCart(productCart);
                              var listsGroupsByNameShop =
                                  Provider.of<ListProductCart>(context,
                                          listen: false)
                                      .listsGroupsByNameShop;
                              Provider.of<CheckBoxCartScreen>(context,
                                      listen: false)
                                  .addItemsCheckbox(listsGroupsByNameShop);
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 20,
                          height: 35,
                          decoration: BoxDecoration(
                            color: valueSlected != '' ||
                                    productCart.classify.isNotEmpty
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
                              color: valueSlected != '' ||
                                      productCart.classify.isNotEmpty
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // aniamtion image add to cart
          ListenableBuilder(
              listenable: Listenable.merge(
                [manager.productsize, manager.productPosition],
              ),
              builder: (context, _) {
                return SizedBox(
                  width: manager.productsize.value.width,
                  height: manager.productsize.value.height,
                  child: CachedNetworkImage(
                    imageUrl: widget.model.image[indexImage],
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return Container(
                        color: Colors.black45,
                      );
                    },
                  )
                      .animate(
                        autoPlay: false,
                        controller: controller,
                      )
                      .scale(
                        delay: productAnimation * 0.2,
                        duration: productAnimation * 0.8,
                        begin: const Offset(1, 1),
                        end: Offset.zero,
                        alignment: Alignment.bottomRight,
                      ),
                )
                    .animate(
                      autoPlay: false,
                      controller: controller,
                      onComplete: (controller) {
                        controller.reset();
                        manager.reset();
                        // cartController.forward();
                      },
                    )
                    .followPath(
                      duration: productAnimation,
                      path: manager.path,
                      curve: Curves.easeInOut,
                    );
              }),
        ],
      ),
    );
  }
}
