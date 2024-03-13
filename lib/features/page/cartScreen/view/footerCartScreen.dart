import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../constants/global_variables.dart';
import '../../../../provider/checkboxCartScreen.dart';
import '../../../../provider/listProductCart.dart';
import '../../../../provider/selectedProductCart.dart';

class FooterCartScreen extends StatefulWidget {
  const FooterCartScreen({super.key});

  @override
  State<FooterCartScreen> createState() => _FooterCartScreenState();
}

class _FooterCartScreenState extends State<FooterCartScreen> {
  bool isChecked = false;
  int productChosed = 0;
  @override
  Widget build(BuildContext context) {
    String totalPayment =
        Provider.of<SelectedProductCart>(context, listen: true).getTotalPrice;
    productChosed = Provider.of<SelectedProductCart>(context, listen: true)
        .getListSelected
        .length;
    return Container(
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
          Row(
            children: [
              const Gap(5),
              SizedBox(
                width: 20,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: GloblalVariable.hex_f94f2f,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                    Provider.of<CheckBoxCartScreen>(context, listen: false)
                        .setAllCheckBoxShop(isChecked);
                    //---
                    var listItems =
                        Provider.of<ListProductCart>(context, listen: false)
                            .getListItems;

                    Provider.of<SelectedProductCart>(context, listen: false)
                        .setListItemsSelected(listItems, isChecked);
                  },
                ),
              ),
              const Gap(5),
              const Text(
                'Tất cả',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Text(
                      'Tổng thanh toán',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'đ$totalPayment',
                      style: const TextStyle(
                        fontSize: 14,
                        color: GloblalVariable.hex_f94f2f,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              //--- button buy product ---
              Container(
                // width: 125,
                height: 60,
                color: GloblalVariable.hex_f94f2f,
                alignment: Alignment.center,
                child: Text(
                  'Mua hàng ($productChosed)',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}