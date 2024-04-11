import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/provider/checkboxCartScreen.dart';
import 'package:clone_shoppe/provider/listProductCart.dart';
import 'package:clone_shoppe/provider/selectedProductCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderDetailShoppingCart extends StatefulWidget {
  final String nameShop;

  const HeaderDetailShoppingCart({
    super.key,
    required this.nameShop,
  });
  @override
  State<HeaderDetailShoppingCart> createState() =>
      _HeaderDetailShoppingCartState();
}

class _HeaderDetailShoppingCartState extends State<HeaderDetailShoppingCart> {
  @override
  Widget build(BuildContext context) {
    var isCheckShop = Provider.of<CheckBoxCartScreen>(context, listen: true)
        .listsCheckBoxShop;
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 12),
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: GloblalVariable.hex_f94f2f,
                value: isCheckShop[widget.nameShop]!,
                onChanged: (bool? value) {
                  setState(() {
                    Provider.of<CheckBoxCartScreen>(context, listen: false)
                        .setCheckBoxShop(widget.nameShop);
                    Provider.of<CheckBoxCartScreen>(context, listen: false)
                        .setCheckBoxByShop(widget.nameShop);
                    var listsGroupsByNameShop =
                        Provider.of<ListProductCart>(context, listen: false)
                            .getlistsGroupsByNameShop;
                    Provider.of<SelectedProductCart>(context, listen: false)
                        .setListItemsSelected(
                            listsGroupsByNameShop[widget.nameShop]!,
                            isCheckShop[widget.nameShop]!);
                  });
                },
              ),
              const SizedBox(width: 10),
              Container(
                width: 34,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xffd0011b),
                ),
                child: const Text(
                  'Mall',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 170),
                child: Text(
                  widget.nameShop,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black45,
              )
            ],
          ),
          const Text(
            'Sửa',
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.none,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
