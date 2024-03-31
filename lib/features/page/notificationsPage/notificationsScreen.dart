import 'package:clone_shoppe/layout/header/header.dart';
import 'package:clone_shoppe/layout/header/widget/headerWithTitleText.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
