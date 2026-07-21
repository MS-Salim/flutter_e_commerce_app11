import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/products/presentation/lobby_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/products/presentation/product_details_screen.dart';
import '../../features/products/data/product_model.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/lobby', builder: (context, state) => const LobbyScreen()),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailsScreen(product: product);
        },
      ),
    ],
  );
}
