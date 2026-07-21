import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/dio_helper.dart';
import 'core/routing/app_router.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()..getProducts()),
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
