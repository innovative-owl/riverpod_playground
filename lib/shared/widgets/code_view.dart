import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_playground/shared/widgets/markdown/markdown_viewer.dart';

class CodeView extends ConsumerWidget {
  static const name = 'code_view';
  static const path = '/code';

  const CodeView({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markdown = ref.watch(
      loadStringAssetProvider(assetPath),
    );

    return Scaffold(
      appBar: AppBar(),
      body: markdown.maybeWhen(
        orElse: SizedBox.shrink,
        data: (data) {
          return MarkdownViewer(data);
        },
      ),
    );
  }
}
