import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_store_app/features/splash/presentation/splash__screen.dart';
import '../../features/auth/presentation/welcome_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/auth/presentation/verification_screen.dart';
import '../../features/products/presentation/lobby_screen.dart';
import '../../features/products/presentation/product_details_screen.dart';
import '../../features/products/data/product_model.dart';
import 'main_layout.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../injection_container.dart' as di;
import '../../features/home/presentation/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _authNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
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
      ShellRoute(
        navigatorKey: _authNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => di.sl<AuthCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/login',
            parentNavigatorKey: _authNavigatorKey,
            builder: (context, state) => LoginScreen(),
          ),
          GoRoute(
            path: '/signup',
            parentNavigatorKey: _authNavigatorKey,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            path: '/verify',
            parentNavigatorKey: _authNavigatorKey,
            builder: (context, state) => VerificationScreen(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
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
