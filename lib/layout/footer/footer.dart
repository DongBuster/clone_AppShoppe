import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/global_variables.dart';
import 'widgets/icon_button.dart';
import 'widgets/icon_buttonHome.dart';

class FooterApp extends StatefulWidget {
  // final StatefulNavigationShell child;

  const FooterApp({super.key});

  @override
  State<FooterApp> createState() => _FooterAppState();
}

class _FooterAppState extends State<FooterApp> {
  // final StatefulNavigationShell stfNavigationShell ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Colors.black12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // home
          GestureDetector(
            onTap: () {
              context.goNamed(GloblalVariable.homeScreen);

              // onTapIconFooter(context, GloblalVariable.homeScreen);
            },
            child: const SizedBox(
              width: 80,
              child: IconButtonHome(
                size: 22,
                pathRoute: '/home',
              ),
            ),
          ),
          // mail
          GestureDetector(
            onTap: () {
              context.goNamed(GloblalVariable.mallScreen);
              // widget.child.goBranch(1);

              // onTapIconFooter(context, GloblalVariable.mallScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.shopping_bag_outlined,
                size: 22,
                text: 'Mall',
                PathRoute: '/mallScreen',
              ),
            ),
          ),
          // live
          GestureDetector(
            onTap: () {
              // widget.child.goBranch(2);
              context.goNamed(GloblalVariable.liveScreen);

              // onTapIconFooter(context, GloblalVariable.liveScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.videocam_outlined,
                size: 25,
                text: 'Live',
                PathRoute: '/liveScreen',
              ),
            ),
          ),
          // notification
          GestureDetector(
            onTap: () {
              // widget.child.goBranch(3);
              context.goNamed(GloblalVariable.notificationsScreen);

              // onTapIconFooter(context, GloblalVariable.notificationsScreen);
            },
            child: SizedBox(
              width: 70,
              child: Stack(
                children: [
                  const IconButtonFooter(
                    icon: Icons.notifications_none_outlined,
                    size: 25,
                    text: 'Thông báo',
                    PathRoute: '/notificationsScreen',
                  ),
                  Positioned(
                    top: 0,
                    right: 17,
                    child: Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: const Text(
                        '99+',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // profile
          GestureDetector(
            onTap: () {
              // widget.child.goBranch(4);
              context.goNamed(GloblalVariable.profileScreen);

              // onTapIconFooter(context, GloblalVariable.profileScreen);
            },
            child: const SizedBox(
              width: 70,
              child: IconButtonFooter(
                icon: Icons.person_2_outlined,
                size: 25,
                text: 'Tôi',
                PathRoute: '/profileScreen',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
