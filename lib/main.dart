import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/dio_helper.dart';
import 'core/routing/app_router.dart';
import 'core/helpers/local_storage_helper.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'core/injection_container.dart' as di;

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  DioHelper.init();
  await LocalStorageHelper.init();
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
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp.router(
            title: 'My Store App',
            debugShowCheckedModeBanner: false,
            themeMode: currentMode,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              scaffoldBackgroundColor: const Color(0xFFF4F7FB),
              primaryColor: const Color(0xFF5C9CE6),
              cardColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFF4F7FB),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black87),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF5C9CE6),
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF121212),
              primaryColor: const Color(0xFF5C9CE6),
              cardColor: const Color(0xFF1E1E1E),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF121212),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF5C9CE6),
                brightness: Brightness.dark,
              ),
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
