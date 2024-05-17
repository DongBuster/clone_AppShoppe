import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/auth/views/login_page.dart';
import 'package:clone_shoppe/features/auth/views/register_page.dart';
import 'package:clone_shoppe/features/page/productsSearchPage/products_search.dart';
import 'package:clone_shoppe/features/page/searchPage/search_page.dart';
import 'package:clone_shoppe/features/page/shoppingCartPage/shopping_cart_page.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/detail_products_page.dart';
import 'package:clone_shoppe/features/page/homePage/home_page.dart';
import 'package:clone_shoppe/features/page/introductoinPage/introduction_page.dart';
import 'package:clone_shoppe/features/page/livePage/live_page.dart';
import 'package:clone_shoppe/features/page/mallPage/mall_page.dart';
import 'package:clone_shoppe/features/page/notificationsPage/notifications_page.dart';
import 'package:clone_shoppe/features/page/profilePage/profile_page.dart';
import 'package:clone_shoppe/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/page/buyProductScreen/buy_product_screen.dart';
import '../features/page/purchaseOrderPage/purchase_order.dart';
import 'custom_transtion_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorLogin =
//     GlobalKey(debugLabel: 'shell');

class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/loginPage',
    routes: [
      GoRoute(
        path: '/loginPage',
        name: GloblalVariable.loginScreen,
        redirect: (context, state) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.getBool('islogin') == true
              ? router.go('/home')
              : router.go('/loginPage');
          return null;
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/registerPage',
        name: GloblalVariable.registerScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: '/introductionPage',
        name: GloblalVariable.introductionPage,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const IntroductionPage(),
        ),
      ),
      GoRoute(
        path: '/cartScreen',
        name: GloblalVariable.cartScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const ShoppingCartPage(),
        ),
        routes: [
          GoRoute(
            path: 'buyProductScreen',
            name: GloblalVariable.buyProductScreen,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const BuyProductScreen(),
            ),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return NoTransitionPage(child: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: GloblalVariable.homeScreen,
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const Mainlayout(child: HomePage()),
                ),
                routes: [
                  GoRoute(
                    path: 'detailProducts',
                    name: GloblalVariable.detailProducts,
                    pageBuilder: (context, state) =>
                        buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const DetailProductsPage(),
                    ),
                  ),
                  GoRoute(
                      path: 'searchPage',
                      name: GloblalVariable.searchPage,
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
                            context: context,
                            state: state,
                            child: const SearchPage(),
                          ),
                      routes: [
                        GoRoute(
                          path: 'productsSearchPage',
                          name: GloblalVariable.productsSearchPage,
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                            context: context,
                            state: state,
                            child: const ProductsSearch(),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/mallScreen',
                name: GloblalVariable.mallScreen,
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const Mainlayout(child: MallPage()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/liveScreen',
                name: GloblalVariable.liveScreen,
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const Mainlayout(child: LivePage()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/notificationsScreen',
                name: GloblalVariable.notificationsScreen,
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const Mainlayout(child: NotificationsPage()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profileScreen',
                name: GloblalVariable.profileScreen,
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const Mainlayout(child: ProfilePage()),
                ),
                routes: [
                  GoRoute(
                    path: 'purchaseOrderScreen',
                    name: GloblalVariable.purchaseOrderScreen,
                    pageBuilder: (context, state) =>
                        buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const PurchaseOrderPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
