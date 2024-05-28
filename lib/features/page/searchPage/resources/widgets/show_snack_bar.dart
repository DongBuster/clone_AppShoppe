import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import '../../../../../constants/global_variables.dart';

class SnackBarCustom extends StatelessWidget {
  const SnackBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.circle, size: 10, color: GloblalVariable.hex_f94f2f)
              .animate(
                  delay: 100.milliseconds,
                  onPlay: (controller) => controller.repeat())
              .moveY(begin: 1, end: -1),
          const Gap(2),
          const Icon(Icons.circle, size: 10, color: GloblalVariable.hex_f94f2f)
              .animate(
                  delay: 200.milliseconds,
                  onPlay: (controller) => controller.repeat())
              .moveY(begin: 2, end: -2),
          const Gap(2),
          const Icon(Icons.circle, size: 10, color: GloblalVariable.hex_f94f2f)
              .animate(
                  delay: 300.milliseconds,
                  onPlay: (controller) => controller.repeat())
              .moveY(begin: 3, end: -3),
        ],
      ),
    );
  }
}
