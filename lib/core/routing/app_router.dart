import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/welcome_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/auth/presentation/verification_screen.dart';
import '../../features/products/presentation/lobby_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/products/presentation/product_details_screen.dart';
import '../../features/products/data/product_model.dart';
import 'main_layout.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/signup', builder: (context, state) => SignUpScreen()),
      GoRoute(
        path: '/verify',
        builder: (context, state) => VerificationScreen(),
      ),
      GoRoute(path: '/lobby', builder: (context, state) => const LobbyScreen()),
      GoRoute(
        path: '/details',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsScreen(product: product);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/products',
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
