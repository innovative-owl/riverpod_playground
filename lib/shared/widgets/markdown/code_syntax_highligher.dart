import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

part 'code_syntax_highligher.g.dart';

@riverpod
Highlighter highlighter(HighlighterRef ref) => throw UnimplementedError();

class CodeSyntaxHighlighter extends SyntaxHighlighter {
  CodeSyntaxHighlighter({required this.highlighter});

  final Highlighter highlighter;

  @override
  TextSpan format(String source) {
    final highlightedCode = highlighter.highlight(source);
    return highlightedCode;
  }
}
