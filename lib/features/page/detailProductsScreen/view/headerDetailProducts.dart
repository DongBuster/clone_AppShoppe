import 'package:clone_shoppe/common/widgets/IconShoppingCart.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/detailProductsScreen/widget/IconButtonHeader.dart';
import 'package:clone_shoppe/provider/headerDetailProduct.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HeaderDetailProducts extends StatefulWidget {
  const HeaderDetailProducts({super.key});

  @override
  State<HeaderDetailProducts> createState() => _HeaderDetailProductsState();
}

class _HeaderDetailProductsState extends State<HeaderDetailProducts> {
  final _focusNode = FocusNode();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<SateHeaderDetailProduct>(context, listen: true)
                .getIsChangeHeader ==
            false
        ? Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // button back
                GestureDetector(
                  onTap: () {
                    Provider.of<SateHeaderDetailProduct>(context, listen: false)
                        .setNotActiveChangeHeader();
                    context.pop();
                  },
                  child: const IconButtonHeader(
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // button share
                      GestureDetector(
                        child: const IconButtonHeader(
                          child: Icon(
                            Icons.share,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // button cart
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(GloblalVariable.cartScreen);
                        },
                        child:
                            const IconButtonHeader(child: IconShoppingCart()),
                      ),
                      //button more
                      GestureDetector(
                        child: const IconButtonHeader(
                          child: Icon(
                            Icons.more_vert,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // button back
                GestureDetector(
                  onTap: () {
                    context.pop();
                    Provider.of<SateHeaderDetailProduct>(context, listen: false)
                        .setNotActiveChangeHeader();
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 30,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: GloblalVariable.hex_f94f2f,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      onTapOutside: (event) => _focusNode.unfocus(),
                      focusNode: _focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: const Color(0xff9c9c9c),
                      cursorHeight: 22,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        // center text
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide.none),
                        hintText: 'Quần áo',
                        hintStyle: const TextStyle(
                          color: Color(0xff9c9c9c),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),

                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          size: 22,
                          color: GloblalVariable.hex_9c9c9c,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // button share
                      GestureDetector(
                        child: const Icon(
                          Icons.share,
                          size: 25,
                          color: GloblalVariable.hex_f94f2f,
                        ),
                      ),
                      // button cart
                      GestureDetector(
                          onTap: () {
                            context.goNamed(GloblalVariable.cartScreen);
                          },
                          child: const IconShoppingCart()),
                      //button more
                      GestureDetector(
                        child: const Icon(
                          Icons.more_vert,
                          size: 28,
                          color: GloblalVariable.hex_f94f2f,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
