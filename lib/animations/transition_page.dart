import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  final Widget child;
  const TransitionPage({super.key, required this.child});

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300))
    ..forward();

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ),
      ),
      child: widget.child,
    );
  }
}
