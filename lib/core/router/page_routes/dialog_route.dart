import 'package:flutter/material.dart';

class DialogPageRoute<T> extends Page<T> {
  final Widget child;
  final bool dismissible;

  const DialogPageRoute({
    required this.child,
    this.dismissible = false,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        barrierDismissible: dismissible,
        barrierColor: dismissible
            ? Colors.black54
            : Theme.of(context).scaffoldBackgroundColor,
        builder: (context) {
          return Dialog(
            child: child,
          );
        },
      );
}
