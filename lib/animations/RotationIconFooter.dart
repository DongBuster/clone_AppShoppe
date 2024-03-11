import 'package:flutter/material.dart';

class RotationIconFooter extends StatefulWidget {
  final bool isChangeIcon;
  final Color color;
  const RotationIconFooter(
      {super.key, required this.isChangeIcon, required this.color});

  @override
  State<RotationIconFooter> createState() => _RotationIconFooterState();
}

class _RotationIconFooterState extends State<RotationIconFooter>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationIcon;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 500),
    )..forward();
    animationIcon = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      transitionBuilder: (child, animation) {
        return RotationTransition(
          turns: child.key == const ValueKey('iconHome')
              ? Tween<double>(begin: 1, end: 0.0).animate(animation)
              : Tween<double>(begin: 0.0, end: 1).animate(animation),
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: widget.isChangeIcon
          ? Icon(
              key: const ValueKey('iconHome'),
              Icons.home,
              size: 28,
              color: widget.color,
            )
          : Icon(
              key: const ValueKey('iconThumb_up'),
              Icons.thumb_up,
              size: 28,
              color: widget.color,
            ),
    );
  }
}
