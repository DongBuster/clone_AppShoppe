import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/models/product_shopping_cart_model.dart';
import 'package:clone_shoppe/provider/checkbox_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/selected_product_cart.dart';
import '../../view_models/state_cart_page.dart';

class CheckBox extends StatefulWidget {
  final String nameShop;

  final ProductShoppingCartModel model;
  const CheckBox({
    super.key,
    required this.model,
    required this.nameShop,
  });
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var listsCheckBoxByShop =
        Provider.of<CartPageViewModel>(context, listen: true)
            .stateCartPage
            .listsCheckBoxByNameShop;
    Map<String, bool> childCheckBox = listsCheckBoxByShop[widget.nameShop]!;

    // if (widget.isChecked && widget.model.classify.isNotEmpty) {
    //   Provider.of<CheckBoxCartScreen>(context, listen: false)
    //       .addItemSelected(widget.model);

    //   print("selected: " +
    //       widget.model.nameProduct +
    //       "\nclassify: " +
    //       widget.model.classify[0] +
    //       "\nprice: " +
    //       widget.model.price);
    // } else if (widget.isChecked) {
    //   Provider.of<CheckBoxCartScreen>(context, listen: false)
    //       .addItemSelected(widget.model);
    //   print("selected: " +
    //       widget.model.nameProduct +
    //       "\nprice: " +
    //       widget.model.price);
    // }
    return Checkbox(
      checkColor: Colors.white,
      activeColor: GloblalVariable.hex_f94f2f,
      value: childCheckBox[widget.model.classify.keys.first],
      onChanged: (bool? value) {
        setState(() {
          childCheckBox[widget.model.classify.keys.first] = value!;
          Provider.of<CartPageViewModel>(context, listen: false)
              .setItemsSelected(widget.model,
                  childCheckBox[widget.model.classify.keys.first]!);
        });
      },
    );
  }
}
