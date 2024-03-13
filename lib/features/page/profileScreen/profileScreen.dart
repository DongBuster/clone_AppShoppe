import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/constants/SnackBar.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/profileScreen/feature_link.dart';

import 'package:flutter/material.dart';
import 'package:clone_shoppe/features/auth/services/service_loginWithAccout.dart';
import 'package:clone_shoppe/features/auth/services/service_loginWithGoogle.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'icon_shopping_cart.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

String? getUsernameFromCurrentUser() {
  if (_googleSignIn.currentUser != null) {
    String? username = _googleSignIn.currentUser!.displayName;
    return username;
  } else {
    return null;
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color primaryColor = GloblalVariable.hex_f94f2f;
  String? username = getUsernameFromCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(color: Colors.black12),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 24, 10, 10),
                height: 150,
                color: primaryColor,
                child: Column(
                  children: [
                    //--- header ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //----- my shop -----
                        Container(
                          width: 85,
                          height: 22,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            children: [
                              const Gap(4),
                              Text(
                                'Shop của tôi',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(3),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: primaryColor,
                              )
                            ],
                          ),
                        ),
                        //----  icon header ----
                        Row(
                          children: [
                            GestureDetector(
                              onTap: null,
                              child: const Icon(
                                Icons.settings,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(12),
                            const IconShoppingCartProfile(),
                            const Gap(12),
                            GestureDetector(
                              onTap: null,
                              child: const Icon(
                                Icons.message_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(15),
                    //---- user info ----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //--- avatar ----
                        const Gap(12),

                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: 'rr',
                            // fit: BoxFit.fill,
                            errorWidget: (context, url, error) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/img/user_default.jpg',
                                  width: 50,
                                  height: 50,
                                  // fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),

                        const Gap(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'dongbuster',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(5),
                            Container(
                              width: 95,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Gap(4),
                                  Text(
                                    'Thành viên bạc',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(3),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black54,
                                  )
                                ],
                              ),
                            ),
                            const Gap(5),
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(text: 'Người theo dõi'),
                                        TextSpan(
                                          text: ' 0',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  width: 1,
                                  height: 10,
                                  color: Colors.black26,
                                ),
                                RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(text: 'Đang theo dõi'),
                                        TextSpan(
                                          text: ' 8',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Column(
                  children: [
                    FeatureLink(
                        icon: Icons.vibration,
                        colorIcon: Colors.green,
                        title: 'Đơn giá và dịch vụ',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    FeatureLink(
                        icon: Icons.event_note,
                        colorIcon: Colors.indigoAccent,
                        title: 'Đơn mua',
                        description: 'Xem lịch sử mua hàng',
                        isBorderBottom: true,
                        isBorderTop: false),
                    FeatureLink(
                        icon: Icons.restaurant,
                        colorIcon: Colors.red,
                        title: 'Đơn ShoppeFood',
                        description: '',
                        isBorderBottom: false,
                        isBorderTop: false),
                  ],
                ),
              ),
              const Gap(8),

              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    const FeatureLink(
                        icon: Icons.workspace_premium,
                        colorIcon: Colors.green,
                        title: 'Khách hàng thân thiết',
                        description: 'Thành viên Bạc',
                        isBorderBottom: true,
                        isBorderTop: false),
                    const FeatureLink(
                        icon: Icons.live_tv,
                        colorIcon: Colors.yellow,
                        title: 'Shoppe Live',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    const FeatureLink(
                        icon: Icons.favorite_border,
                        colorIcon: GloblalVariable.hex_f94f2f,
                        title: 'Đã thích',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    FeatureLink(
                        icon: Icons.add_business,
                        colorIcon: Colors.yellow.shade500,
                        title: 'Shop đang theo dõi',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    const FeatureLink(
                        icon: Icons.card_giftcard,
                        colorIcon: Colors.indigo,
                        title: 'Săn thưởng Shoppe',
                        description: 'Lấy ngay 1,000 xu',
                        isBorderBottom: true,
                        isBorderTop: false),
                    FeatureLink(
                        icon: Icons.history,
                        colorIcon: Colors.indigo.shade300,
                        title: 'Đã xem gần đây',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    const FeatureLink(
                        icon: Icons.account_balance_wallet,
                        colorIcon: GloblalVariable.hex_f94f2f,
                        title: 'Số dư tài khoản',
                        description: '',
                        isBorderBottom: true,
                        isBorderTop: false),
                    const FeatureLink(
                        icon: Icons.star,
                        colorIcon: Colors.green,
                        title: 'Đánh giá của tôi',
                        description: '',
                        isBorderBottom: false,
                        isBorderTop: false),
                  ],
                ),
              ),
              const Gap(8),

              GestureDetector(
                onTap: () async {
                  loginWithAccount.logOut();
                  LoginWithGoogle.logOut();
                  if (mounted) {
                    context.goNamed(GloblalVariable.authScreen);
                  } else {
                    showSnackBar(
                        context, 'Something went wrong, please try again');
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: GloblalVariable.hex_f94f2f,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )

                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: Colors.amber,
                    //     foregroundColor: Colors.blue,
                    //     padding: const EdgeInsets.all(16.0),
                    //     textStyle: const TextStyle(fontSize: 20),
                    //   ),
                    //   onPressed: () async {
                    //     loginWithAccount.logOut();
                    //     LoginWithGoogle.logOut();
                    //     if (mounted) {
                    //       context.goNamed(GloblalVariable.authScreen);
                    //     } else {
                    //       showSnackBar(
                    //           context, 'Something went wrong, please try again');
                    //     }
                    //   },
                    //   child: const Text(
                    //     'logout',
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    // ),
                    ),
              ),
              const Gap(60),

              // Text(
              //   username != null ? 'Username: $username' : 'error',
              //   style: const TextStyle(color: Colors.red),
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}
