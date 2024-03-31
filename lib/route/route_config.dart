import 'package:clone_shoppe/animations/TransitionPage.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/auth/views/login_page.dart';
import 'package:clone_shoppe/features/auth/views/register_page.dart';
import 'package:clone_shoppe/features/page/cartPage/cartScreen.dart';
import 'package:clone_shoppe/features/page/detailProductsPage/detailProductsScreen.dart';
import 'package:clone_shoppe/features/page/homePage/homeScreen.dart';
import 'package:clone_shoppe/features/page/livePage/liveScreen.dart';
import 'package:clone_shoppe/features/page/mallPage/mallScreen.dart';
import 'package:clone_shoppe/features/page/notificationsPage/notificationsScreen.dart';
import 'package:clone_shoppe/features/page/profilePage/profileScreen.dart';
import 'package:clone_shoppe/layout/mainlayout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/page/introductoinPage/introduction_screen.dart';
import '../features/page/buyProductScreen/buy_product_screen.dart';
import '../features/page/purchaseOrderPage/purchase_order.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorLogin =
//     GlobalKey(debugLabel: 'shell');

class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: GloblalVariable.authScreen,
        redirect: (context, state) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.getBool('islogin') == true
              ? router.go('/home')
              : router.go('/login');
          return null;
        },
        builder: (context, state) => const TransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: GloblalVariable.registerScreen,
        builder: (context, state) => const TransitionPage(
          child: RegisterPage(),
        ),
        routes: [
          GoRoute(
            path: 'purchaseOrderScreen',
            name: GloblalVariable.purchaseOrderScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PurchaseOrder(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/cartScreen',
        name: GloblalVariable.cartScreen,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TransitionPage(child: CartScreen()),
        ),
        routes: [
          GoRoute(
            path: 'buyProductScreen',
            name: GloblalVariable.buyProductScreen,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TransitionPage(child: BuyProductScreen()),
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
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Mainlayout(child: HomeScreen()),
                ),
                routes: [
                  GoRoute(
                    path: 'detailProducts',
                    name: GloblalVariable.detailProducts,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: TransitionPage(child: DetailProductsScreen()),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/mallScreen',
                name: GloblalVariable.mallScreen,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Mainlayout(child: MallScreen()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/liveScreen',
                name: GloblalVariable.liveScreen,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Mainlayout(child: LiveScreen()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/notificationsScreen',
                name: GloblalVariable.notificationsScreen,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Mainlayout(child: NotificationsScreen()),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profileScreen',
                name: GloblalVariable.profileScreen,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Mainlayout(child: ProfileScreen()),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
