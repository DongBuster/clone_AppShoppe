import 'package:flutter/material.dart';

class ScrollBar extends StatefulWidget {
  bool isScroll;
  ScrollBar({super.key, required this.isScroll});

  @override
  State<ScrollBar> createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: 40,
            height: 6,
          ),
          AnimatedPositioned(
            top: 0,
            left: widget.isScroll ? 20 : 0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: widget.isScroll
                      ? const Radius.circular(0)
                      : const Radius.circular(5),
                  bottomLeft: widget.isScroll
                      ? const Radius.circular(0)
                      : const Radius.circular(5),
                  topRight: widget.isScroll
                      ? const Radius.circular(5)
                      : const Radius.circular(0),
                  bottomRight: widget.isScroll
                      ? const Radius.circular(5)
                      : const Radius.circular(0),
                ),
                color: Colors.redAccent,
              ),
              width: 20,
              height: 6,
            ),
          ),
        ],
      ),
    );
  }
}
