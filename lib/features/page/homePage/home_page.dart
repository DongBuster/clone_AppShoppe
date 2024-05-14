import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../layout/header/header.dart';
import '../../../layout/header/widget/header_with_search.dart';
import 'views/banner.dart';
import 'views/banner_special.dart';
import 'views/electronic_wallet.dart';
import 'views/list_items_category.dart';
import 'views/list_product_recommend.dart';
import 'views/list_product_sale.dart';
import 'resources/widgets/coutdow_timer.dart';
import 'view_models/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Provider.of<HomePageViewModel>(context, listen: false)
                  .setStateHomePage(notification);

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
                              height: 300,
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
                                  ListProductSale(),
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
                    const ListProductRecommend(),
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
