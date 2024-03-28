import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/profileScreen/feature_link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../common/widgets/text.dart';
import '../../../provider/bought_product.dart';
import '../../auth/services/auth.dart';

import 'icon_shopping_cart.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color primaryColor = GloblalVariable.hex_f94f2f;
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Warning!',
      message: 'Something error occurred, please try again !',
      contentType: ContentType.warning,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  Future<String> getNameUser(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data['name'];
  }

  Future<String> getImageUrl(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data['image'];
  }

  @override
  Widget build(BuildContext context) {
    int quantityBoughtProduct =
        Provider.of<BoughtProduct>(context, listen: true)
            .getListBoughtProduct
            .length;
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
                                GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                          GloblalVariable.cartScreen);
                                    },
                                    child: const IconShoppingCartProfile()),
                                const Gap(12),
                                GestureDetector(
                                  child: badges.Badge(
                                    badgeStyle: const badges.BadgeStyle(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    position: badges.BadgePosition.topStart(
                                        top: -12, start: 12),
                                    badgeContent: const MyText(
                                        text: '3',
                                        fontSize: 10,
                                        fontWeight: null,
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.message_outlined,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(15),
                        //---- user info ----
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //--- avatar ----
                            const Gap(12),

                            user == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      'assets/img/user_default.jpg',
                                      width: 70,
                                      height: 70,
                                    ),
                                  )
                                : FutureBuilder(
                                    future: getImageUrl(user!.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            "Something went wrong");
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return ClipOval(
                                          child: CachedNetworkImage(
                                            width: 70,
                                            height: 70,
                                            imageUrl: snapshot.data ?? '',
                                            errorWidget: (context, url, error) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Image.asset(
                                                  'assets/img/user_default.jpg',
                                                  width: 70,
                                                  height: 70,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          'assets/img/user_default.jpg',
                                          width: 70,
                                          height: 70,
                                        ),
                                      );
                                    },
                                  ),

                            //-- user name ---
                            const Gap(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                  future: getNameUser(user!.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text("Something went wrong");
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Text(
                                        snapshot.data ?? 'Unknown user',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                    return const Text(
                                      'Unknown user',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
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
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      width: 1,
                                      height: 10,
                                      color: Colors.black38,
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
                    child: Column(
                      children: [
                        const FeatureLink(
                            icon: Icons.vibration,
                            colorIcon: Colors.green,
                            title: 'Đơn giá và dịch vụ',
                            description: '',
                            isBorderBottom: true,
                            isBorderTop: false),
                        const FeatureLink(
                            icon: Icons.event_note,
                            colorIcon: Colors.indigoAccent,
                            title: 'Đơn mua',
                            description: 'Xem lịch sử mua hàng',
                            isBorderBottom: true,
                            isBorderTop: false),
                        Container(
                          margin: const EdgeInsets.all(12),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.unarchive_outlined,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                  Gap(5),
                                  Text(
                                    'Chờ xác nhận',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black38,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.goNamed(
                                      GloblalVariable.purchaseOrderScreen);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    badges.Badge(
                                      badgeStyle: const badges.BadgeStyle(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      position: badges.BadgePosition.topStart(
                                          top: -12, start: 12),
                                      badgeContent: MyText(
                                        text: '$quantityBoughtProduct',
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        Icons.card_giftcard_rounded,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const Gap(5),
                                    const Text(
                                      'Chờ lấy hàng',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black38,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                  Gap(5),
                                  Text(
                                    'Chờ giao hàng',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black38,
                                    ),
                                  )
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.stars_outlined,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                  Gap(5),
                                  Text(
                                    'Đánh giá',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black38,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const FeatureLink(
                            icon: Icons.restaurant,
                            colorIcon: Colors.red,
                            title: 'Đơn ShoppeFood',
                            description: '',
                            isBorderBottom: false,
                            isBorderTop: true),
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
                        GestureDetector(
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              await Auth.signOut().then((value) {
                                context.goNamed(GloblalVariable.authScreen);
                                prefs.setBool('islogin', false);
                                prefs.setString('email', '');
                              }).catchError((error) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });
                            },
                            child: const FeatureLink(
                              icon: Icons.logout_rounded,
                              colorIcon: Colors.redAccent,
                              title: 'Logout',
                              description: '',
                              isBorderBottom: false,
                              isBorderTop: true,
                            )),
                      ],
                    ),
                  ),
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
