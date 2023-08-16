import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger_plus/logger_plus.dart';

class DevicePreviewLogger extends ConsumerWidget {
  const DevicePreviewLogger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToolPanelSection(
      title: 'Logger',
      children: [
        ListTile(
          title: const Text('Logger'),
          trailing: const Icon(Icons.code),
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LogConsole(
                    dark: true,
                    showCloseButton: true,
                  );
                },
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ],
    );
  }
}
