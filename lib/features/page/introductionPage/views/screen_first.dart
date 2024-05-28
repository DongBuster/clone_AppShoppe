import 'package:flutter/material.dart';

class ScreenFirst extends StatelessWidget {
  const ScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/intro_welcome.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
    );
  }
}
