import 'package:flutter/material.dart';

class FlagShop extends StatelessWidget {
  final int typeShop;
  const FlagShop({super.key, required this.typeShop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          typeShop == 0
              ? Container(
                  alignment: Alignment.center,
                  width: 28,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xffd0011b),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: const Text(
                    'Mall',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xfff25220),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: const Text(
                    'Yêu thích',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
          SizedBox(
            width: 3,
            height: 3,
            child: CustomPaint(
              painter: TrianglePainter(),
            ),
          )
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}
