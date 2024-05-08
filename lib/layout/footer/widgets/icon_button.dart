import 'package:flutter/material.dart';

import '../handles/handle_footer.dart';

class IconButtonFooter extends StatelessWidget {
  final double size;
  final IconData icon;
  final String text;
  final String PathRoute;
  const IconButtonFooter(
      {super.key,
      required this.icon,
      required this.text,
      required this.size,
      required this.PathRoute});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: size,
          color: colorCurrentRoute(context, PathRoute),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: colorCurrentRoute(context, PathRoute),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
