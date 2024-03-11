import 'package:clone_shoppe/animations/TransitionPage.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/auth/screens/auth_screen.dart';
import 'package:clone_shoppe/features/auth/screens/login_screen.dart';
import 'package:clone_shoppe/features/auth/screens/register_screen.dart';
import 'package:clone_shoppe/features/page/cartScreen/cartScreen.dart';
import 'package:clone_shoppe/features/page/detailProductsScreen/detailProductsScreen.dart';
import 'package:clone_shoppe/features/page/homeScreen/homeScreen.dart';
import 'package:clone_shoppe/features/page/liveScreen/liveScreen.dart';
import 'package:clone_shoppe/features/page/mallScreen/mallScreen.dart';
import 'package:clone_shoppe/features/page/notificationsScreen/notificationsScreen.dart';
import 'package:clone_shoppe/features/page/profileScreen/profileScreen.dart';
import 'package:clone_shoppe/layout/mainlayout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorLogin =
    GlobalKey(debugLabel: 'shell');

class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/auth',
        name: GloblalVariable.authScreen,
        builder: (context, state) => const TransitionPage(
          child: AuthScreen(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: GloblalVariable.loginScreen,
        builder: (context, state) => const TransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: GloblalVariable.registerScreen,
        builder: (context, state) => const TransitionPage(
          child: RegisterScreen(),
        ),
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
                    routes: [
                      GoRoute(
                        path: 'cartScreen',
                        name: GloblalVariable.cartScreen,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: TransitionPage(child: CartScreen()),
                        ),
                      ),
                    ],
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

      // ShellRoute(
      //   navigatorKey: _shellNavigatorLogin,
      //   builder: (context, state, child) => child,
      //   routes: [
      //     GoRoute(
      //       path: '/home',
      //       name: GloblalVariable.homeScreen,
      //       pageBuilder: (context, state) => const NoTransitionPage(
      //         child: Mainlayout(
      //           child: HomeScreen(),
      //         ),
      //       ),
      //     ),
      //     GoRoute(
      //       path: '/mallScreen',
      //       name: GloblalVariable.mallScreen,
      //       pageBuilder: (context, state) => const NoTransitionPage(
      //         child: Mainlayout(
      //           child: MallScreen(),
      //         ),
      //       ),
      //     ),
      //     GoRoute(
      //       path: '/liveScreen',
      //       name: GloblalVariable.liveScreen,
      //       pageBuilder: (context, state) => const NoTransitionPage(
      //         child: Mainlayout(
      //           child: LiveScreen(),
      //         ),
      //       ),
      //     ),
      //     GoRoute(
      //       path: '/notificationsScreen',
      //       name: GloblalVariable.notificationsScreen,
      //       pageBuilder: (context, state) => const NoTransitionPage(
      //         child: Mainlayout(
      //           child: NotificationsScreen(),
      //         ),
      //       ),
      //     ),
      //     GoRoute(
      //       path: '/profileScreen',
      //       name: GloblalVariable.profileScreen,
      //       pageBuilder: (context, state) => const NoTransitionPage(
      //         child: Mainlayout(
      //           child: ProfileScreen(),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    ],
  );
}
