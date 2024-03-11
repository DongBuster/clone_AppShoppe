import 'package:flutter/material.dart';

import '../animations/TransitionPage.dart';
import 'footer/footer.dart';

class Mainlayout extends StatefulWidget {
  // final StatefulNavigationShell child;
  final Widget child;
  const Mainlayout({super.key, required this.child});

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  @override
  Widget build(BuildContext context) {
    // print(widget.navigationShell.currentIndex);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          TransitionPage(child: widget.child),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FooterApp(),
          ),
        ],
      ),
    );
  }
}
