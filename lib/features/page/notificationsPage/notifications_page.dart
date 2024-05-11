import 'package:clone_shoppe/layout/header/header.dart';
import 'package:clone_shoppe/layout/header/widget/header_with_title_text.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black12)),
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderApp(
            child: TitleText(text: 'Thông báo'),
          ),
        ),
      ],
    );
  }
}
