import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/cartModel.dart';
import 'package:clone_shoppe/provider/checkboxCartScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBox extends StatefulWidget {
  CheckBox({super.key, required this.isChecked, required this.model});
  bool isChecked;
  final CartModel model;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
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
      value: widget.isChecked,
      onChanged: (bool? value) {
        // print('A: ${widget.isChecked}');
        setState(() {
          widget.isChecked = !widget.isChecked;
          // print('B: ${widget.isChecked}');
        });
      },
    );
  }
}
