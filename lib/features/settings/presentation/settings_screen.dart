import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_store_app/main.dart';
import 'package:my_store_app/main.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, currentMode, child) {
              bool isDark = currentMode == ThemeMode.dark;
              return SwitchListTile(
                secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                title: const Text('Dark Mode'),
                value: isDark,
                onChanged: (value) {
                  themeNotifier.value = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Privacy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.red,
            ),
            onTap: () {
              context.go('/welcome');
            },
          ),
        ],
      ),
    );
  }
}
