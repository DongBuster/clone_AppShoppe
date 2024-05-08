import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../../constants/global_variables.dart';
import '../../../../models/cart_model.dart';
import '../../../../provider/list_product_cart.dart';
import '../../../../provider/selected_product_cart.dart';

class FixShoppingCart extends StatefulWidget {
  final Widget child;
  final CartModel model;
  const FixShoppingCart({super.key, required this.child, required this.model});

  @override
  State<FixShoppingCart> createState() => _FixShoppingCartState();
}

class _FixShoppingCartState extends State<FixShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            spacing: 1,
            padding: EdgeInsets.all(0),
            label: 'Sản phẩm \n tương tự',
          ),
          SlidableAction(
            onPressed: (context) {
              Provider.of<ListProductCart>(context, listen: false)
                  .removeProductToCart(widget.model);
              Provider.of<SelectedProductCart>(context, listen: false)
                  .removeItemsSelected(widget.model);
            },
            backgroundColor: GloblalVariable.hex_f94f2f,
            foregroundColor: Colors.white,
            label: 'Xóa',
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
