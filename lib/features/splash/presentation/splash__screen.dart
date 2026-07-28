import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/helpers/local_storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnData();
  }

  void _navigateBasedOnData() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    bool isFirstTime = LocalStorageHelper.getData(key: 'isFirstTime') ?? true;
    String? token = LocalStorageHelper.getData(key: 'token');

    // التوجيه (Redirect)
    if (isFirstTime) {
      await LocalStorageHelper.saveData(key: 'isFirstTime', value: false);
      context.go('/welcome');
    } else if (token != null && token.isNotEmpty) {
      context.go('/products');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.shopping_bag, size: 100, color: Colors.blue),
      ),
    );
  }
}
