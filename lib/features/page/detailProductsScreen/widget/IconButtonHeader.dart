import 'package:flutter/material.dart';

class IconButtonHeader extends StatefulWidget {
  final Widget child;

  const IconButtonHeader({super.key, required this.child});

  @override
  State<IconButtonHeader> createState() => _IconButtonHeaderState();
}

class _IconButtonHeaderState extends State<IconButtonHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: widget.child,
    );
  }
}
