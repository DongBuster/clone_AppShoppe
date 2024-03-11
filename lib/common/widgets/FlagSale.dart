import 'package:flutter/material.dart';

class FlagSale extends StatelessWidget {
  final String? percentSale;
  final int type;
  const FlagSale({super.key, required this.percentSale, required this.type});
  @override
  Widget build(BuildContext context) {
    return type == 1
        ? SizedBox(
            height: 40,
            child: Column(
              children: [
                Container(
                  width: 35,
                  height: 32,
                  color: Colors.yellow,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 3),
                        Text(
                          '${percentSale!}%',
                          style:
                              const TextStyle(fontSize: 10, color: Colors.red),
                        ),
                        const Text(
                          'GIẢM',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 8,
                  child: CustomPaint(
                    painter: TrianglePainter(),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: 35,
            height: 20,
            color: Colors.yellow,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '- $percentSale%',
                    style: const TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);

    path.close();

    final path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}
