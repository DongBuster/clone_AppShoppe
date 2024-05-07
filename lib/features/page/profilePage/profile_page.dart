import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constants/global_variables.dart';
import 'controller/controller_profile_page.dart';
import 'views/header.dart';
import 'views/list_feature_more.dart';
import 'views/my_order.dart';
import 'views/user_info.dart';

Color primaryColor = GloblalVariable.hex_f94f2f;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controllerProfilePage = ControllerProfilePage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('imagefile:$imageFile');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.black12),
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  //-----  ------
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 24, 10, 10),
                    height: 150,
                    color: primaryColor,
                    child: const Column(
                      children: [
                        //--- header ---
                        HeaderProfilePage(),
                        Gap(15),
                        //---- user info ----
                        UserInfo()
                      ],
                    ),
                  ),
                  const Gap(8),
                  //-----  ------
                  const MyOrder(),
                  const Gap(8),
                  //-----  ------
                  const ListFeatureProfilePage(),
                  const Gap(63),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
