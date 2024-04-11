import 'package:clone_shoppe/features/page/homePage/handles/renderProductRecommend.dart';
import 'package:clone_shoppe/features/page/homePage/handles/renderProductSale.dart';
import 'package:clone_shoppe/features/page/homePage/view/Banner.dart';
import 'package:clone_shoppe/features/page/homePage/view/BannerSpecial.dart';
import 'package:clone_shoppe/features/page/homePage/view/ElectronicWallet.dart';
import 'package:clone_shoppe/features/page/homePage/view/ListItemsCategory.dart';
import 'package:clone_shoppe/features/page/homePage/widget/CoutdowTimer.dart';
import 'package:provider/provider.dart';
import 'package:clone_shoppe/layout/header/header.dart';
import 'package:clone_shoppe/layout/header/widget/headerWithSearch.dart';
import 'package:clone_shoppe/provider/stateActiveColorIconHeader.dart';
import 'package:clone_shoppe/provider/stateActiveIconHome.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.black12,
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if (notification.metrics.pixels <= 20 &&
                    notification.metrics.axis == Axis.vertical) {
                  Provider.of<StateActiveIconHome>(context, listen: false)
                      .setNotActiveIconHome();
                  Provider.of<StateActiveColorIconHeader>(context,
                          listen: false)
                      .setNotActiveColorIconHeader();
                } else if (notification.metrics.pixels > 20 &&
                    notification.metrics.axis == Axis.vertical) {
                  Provider.of<StateActiveIconHome>(context, listen: false)
                      .setActiveIconHome();
                  Provider.of<StateActiveColorIconHeader>(context,
                          listen: false)
                      .setActiveColorIconHeader();
                }
              });
              return false;
            },
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //------ content first ------
                    SizedBox(
                      height: 600,
                      child: Stack(
                        children: [
                          // ---- banner -----
                          const BannerProducts(),
                          //-----  Category Product  ------
                          Positioned(
                            top: 220,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.only(top: 60),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: const Column(
                                children: [
                                  //------- list items category ------
                                  ListItemsCategory(),
                                  SizedBox(height: 10),

                                  //------- banner special offer -------
                                  BannerSpecialOffer(),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          //---- electronic wallet ----
                          const Positioned(
                            top: 210,
                            left: 20,
                            right: 20,
                            child: ElectronicWallet(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ----- content second ------
                    Container(
                      height: 280,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            //------ header -------
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/flashsale.png'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const CountdownTimer(seconds: 100000),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: null,
                                  child: const Row(children: [
                                    Text(
                                      'Xem tất cả',
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 13),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.keyboard_arrow_right_rounded,
                                        color: Colors.black38)
                                  ]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // ----- content---------
                            const Expanded(
                              child: Row(
                                children: [
                                  RenderProductSale(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //-------- content third ------
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'GỢI Ý HÔM NAY',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const RenderProductRecommend(),
                    const SizedBox(height: 70)
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderApp(child: Search()),
          ),
        ],
      ),
    );
  }
}
