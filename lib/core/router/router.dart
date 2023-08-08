import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/core/router/redirect.dart';
import 'package:riverpod_playground/core/router/router_listenable.dart';
import 'package:riverpod_playground/core/router/routes/base_routes.dart';
import 'package:riverpod_playground/core/router/routes/login_routes.dart';
import 'package:riverpod_playground/core/router/routes/shared_routes.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  final userState = ref.watch(routerListenableProvider);
  final routerListenable = ref.watch(routerListenableProvider.notifier);
  final routes = ref.watch(routesProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerListenable,
    routes: routes,
    redirect: (context, state) => handleRedirect(
      ref: ref,
      context: context,
      state: state,
      userState: userState,
    ),
  );
}

@riverpod
List<RouteBase> routes(RoutesRef ref) {
  final baseRoutes = ref.watch(baseRoutesProvider);
  final sharedRoutes = ref.watch(sharedRoutesProvider);
  final loginRoutes = ref.watch(loginRoutesProvider);

  return [
    /// Base Routes
    ...baseRoutes,

    /// Shared Routes
    ...sharedRoutes,

    /// Login Routes
    ...loginRoutes,
  ];
}
