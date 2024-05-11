import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class ThreeBallIndicator extends StatefulWidget {
  const ThreeBallIndicator({super.key});

  @override
  State<ThreeBallIndicator> createState() => _ThreeBallIndicatorState();
}

class _ThreeBallIndicatorState extends State<ThreeBallIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.circle,
                      size: 10, color: GloblalVariable.hex_f94f2f)
                  .animate(
                      delay: 100.milliseconds,
                      onPlay: (controller) => controller.repeat())
                  .moveY(begin: 1, end: -1),
              const Gap(2),
              const Icon(Icons.circle,
                      size: 10, color: GloblalVariable.hex_f94f2f)
                  .animate(
                      delay: 200.milliseconds,
                      onPlay: (controller) => controller.repeat())
                  .moveY(begin: 2, end: -2),
              const Gap(2),
              const Icon(Icons.circle,
                      size: 10, color: GloblalVariable.hex_f94f2f)
                  .animate(
                      delay: 300.milliseconds,
                      onPlay: (controller) => controller.repeat())
                  .moveY(begin: 3, end: -3),
            ],
          )),
    );
  }
}
