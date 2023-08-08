import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/core/router/page_routes/page_route_type.dart';
import 'package:riverpod_playground/features/home/presentation/home_screen.dart';

part 'base_routes.g.dart';

@riverpod
List<RouteBase> baseRoutes(BaseRoutesRef ref) {
  return [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        return HomeScreen.path;
      },
    ),
    GoRoute(
      name: HomeScreen.name,
      path: HomeScreen.path,
      pageBuilder: (_, state) => createPage(
        state: state,
        child: const HomeScreen(),
      ),
    ),
  ];
}
