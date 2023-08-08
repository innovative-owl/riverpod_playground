import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/core/router/page_routes/page_route_type.dart';
import 'package:riverpod_playground/features/login_hooks/login_hooks_screen.dart';
import 'package:riverpod_playground/features/login_notifier/login_notifier_screen.dart';

part 'login_routes.g.dart';

@riverpod
List<RouteBase> loginRoutes(LoginRoutesRef ref) {
  return [
    GoRoute(
      name: LoginHooksScreen.name,
      path: LoginHooksScreen.path,
      pageBuilder: (_, state) => createPage(
        state: state,
        child: const LoginHooksScreen(),
      ),
    ),
    GoRoute(
      name: LoginNotifierScreen.name,
      path: LoginNotifierScreen.path,
      pageBuilder: (_, state) => createPage(
        state: state,
        child: const LoginNotifierScreen(),
      ),
    ),
  ];
}
