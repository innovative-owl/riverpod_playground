import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/core/extensions/context_theme_extensions.dart';
import 'package:riverpod_playground/shared/widgets/markdown/code_syntax_highligher.dart';

part 'markdown_viewer.g.dart';

@riverpod
Future<String> loadStringAsset(LoadStringAssetRef ref, String path) {
  return rootBundle.loadString(path);
}

class MarkdownViewer extends ConsumerWidget {
  static const name = 'markdown';
  static const path = '/markdown';

  const MarkdownViewer(
    this.markdown, {
    Key? key,
    this.shrinkWrap = true,
    this.selectable = false,
    this.controller,
    this.physics,
    this.padding = const EdgeInsets.all(16),
    this.textAlign = WrapAlignment.start,
  }) : super(key: key);

  final String markdown;
  final bool shrinkWrap;
  final bool selectable;
  final ScrollController? controller;
  final EdgeInsets padding;
  final WrapAlignment textAlign;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlighter = ref.watch(highlighterProvider);

    return Markdown(
      padding: padding,
      shrinkWrap: shrinkWrap,
      controller: controller,
      physics: physics,
      selectable: selectable,
      softLineBreak: true,
      data: markdown,
      onTapLink: (text, href, title) async {
        // if (href == null) return;
        // // until we get deep linking working
        // if (href.startsWith('http')) {
        //   maybeLaunchUrl(href);
        // } else {
        //   context.push(href);
        // }
      },
      syntaxHighlighter: CodeSyntaxHighlighter(highlighter: highlighter),
      styleSheet: MarkdownStyleSheet(
        textAlign: textAlign,
        h1: context.titleLarge,
        h2: context.titleMedium,
        h3: context.titleMedium,
        h4: context.titleSmall,
        p: context.bodyMedium,
        h1Padding: const EdgeInsets.only(bottom: 10),
        h2Padding: const EdgeInsets.only(bottom: 10),
        h3Padding: const EdgeInsets.only(bottom: 10),
        pPadding: const EdgeInsets.only(bottom: 10),
        listBulletPadding: const EdgeInsets.all(8),
      ),
    );
  }
}
