import 'package:flutter/material.dart';

class AddToCartMannager {
  final AnimationController controller;

  AddToCartMannager(this.controller);

  final productKeys = List.generate(20, (index) => GlobalKey());
  final cartKey = GlobalKey();
  var productsize = ValueNotifier(const Size(0, 0));
  var productPosition = ValueNotifier(Offset.zero);
  var path = Path();

  void dispose() {
    productsize.dispose();
    productPosition.dispose();
  }

  void reset() {
    productsize.value = Size.zero;
    productPosition.value = Offset.zero;
    path = Path();
  }

  void runAnimation(int index) {
    // print(productKeys[index].currentContext ?? 'hsdjfjsdk');

    final productContext = productKeys[index].currentContext!;
    // print(productContext);
    // print(productKeys[index].currentContext!);

    // get position of the product
    final cartPosition =
        (cartKey.currentContext!.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);

    final cartPositionTopRight =
        cartKey.currentContext!.size!.topRight(cartPosition);

    // print(cartPosition.dx);
    // print(cartPosition.dy);
    // get position of the cart
    productPosition.value = (productContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
    // print(productPosition.value.dx);
    // print(productPosition.value.dy);
    // get size of the product
    productsize.value = productContext.size!;

    path = Path()
      ..moveTo(productPosition.value.dx, productPosition.value.dy)
      // ..moveTo(30, 30)
      // ..lineTo(200, 200);
      ..relativeLineTo(-20, -20)
      ..lineTo(cartPositionTopRight.dx - productsize.value.width,
          cartPositionTopRight.dy - productsize.value.height);

    // trigger animation
    controller.forward();
  }
}
