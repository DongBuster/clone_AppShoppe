import 'package:clone_shoppe/layout/header/header.dart';
import 'package:clone_shoppe/layout/header/widget/header_with_search.dart';
import 'package:flutter/material.dart';

class MallPage extends StatefulWidget {
  const MallPage({super.key});

  @override
  State<MallPage> createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue[200],
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderApp(child: Search()),
        ),
      ],
    );
  }
}
