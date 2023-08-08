import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/core/router/page_routes/page_route_type.dart';
import 'package:riverpod_playground/shared/widgets/code_view.dart';
import 'package:riverpod_playground/shared/widgets/markdown/markdown_viewer.dart';

part 'shared_routes.g.dart';

@riverpod
List<RouteBase> sharedRoutes(SharedRoutesRef ref) {
  return [
    GoRoute(
      name: CodeView.name,
      path: CodeView.path,
      pageBuilder: (_, state) {
        final assetPath = state.extra as String;
        return createPage(
          state: state,
          child: CodeView(assetPath: assetPath),
          fullscreenDialog: true,
        );
      },
    ),
    GoRoute(
      name: MarkdownViewer.name,
      path: MarkdownViewer.path,
      pageBuilder: (_, state) {
        final markdown = state.extra as String;

        return createPage(
          state: state,
          child: MarkdownViewer(markdown),
        );
      },
    ),
  ];
}
