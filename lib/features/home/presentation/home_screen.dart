import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_playground/features/login_hooks/login_hooks_screen.dart';
import 'package:riverpod_playground/features/login_notifier/login_notifier_screen.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home';
  static const path = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Login Page (Hooks)'),
            subtitle: const Text('Login page using flutter_hooks'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(LoginHooksScreen.name),
          ),
          ListTile(
            title: const Text('Login Page (Notifier)'),
            subtitle: const Text('Login page using AsyncNotifier/Provider'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.pushNamed(LoginNotifierScreen.name),
          ),
          ListTile(
            title: const Text('Wizard (GoRouter)'),
            subtitle: const Text('Wizard flow using GoRouter'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
