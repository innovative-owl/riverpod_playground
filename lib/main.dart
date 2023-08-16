import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:riverpod_playground/core/logging/logger_provider.dart';
import 'package:riverpod_playground/core/router/router.dart';
import 'package:riverpod_playground/shared/devtools/device_preview.dart';
import 'package:riverpod_playground/shared/widgets/markdown/code_syntax_highligher.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LogConsole.init();

  await Highlighter.initialize(['dart', 'yaml']);
  final theme = await HighlighterTheme.loadDarkTheme();
  final highlighter = Highlighter(
    language: 'dart',
    theme: theme,
  );

  LogConsole.init();

  final logger = Logger(
    printer: PrettyPrinter(),
  );

  final container = ProviderContainer(
    overrides: [
      highlighterProvider.overrideWithValue(highlighter),
      loggerProvider.overrideWithValue(logger),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMacOS = Theme.of(context).platform == TargetPlatform.macOS;
    final enabled = kIsWeb || isMacOS;

    final routerConfig = ref.watch(routerProvider);

    return DevicePreview(
      enabled: enabled,
      tools: [
        ...DevicePreviewTools.customTools,
        ...DevicePreview.defaultTools,
        if (!kIsWeb) ...[
          DevicePreviewScreenshot(
            onScreenshot: (context, screenshot) {
              // log.wtf('Screenshot saved to ${Directory.current}');
              return screenshotAsFiles(Directory.current)(context, screenshot);
            },
          ),
        ],
      ],
      builder: (context) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: kDebugMode,
          title: 'Riverpod Playground',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: ThemeMode.system,
          routerConfig: routerConfig,
        );
      },
    );
  }
}
