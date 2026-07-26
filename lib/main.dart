import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/dio_helper.dart';
import 'core/routing/app_router.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'core/injection_container.dart' as di;

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ProductsCubit>()..getProducts(),
        ),
        BlocProvider(create: (context) => di.sl<CartCubit>()),
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp.router(
            title: 'My Store App',
            debugShowCheckedModeBanner: false,
            themeMode: currentMode,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
