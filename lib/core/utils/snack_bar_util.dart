import 'package:flutter/material.dart';

/// Util class for working with [SnackBar]
class SnackBarUtil {
  /// Shows floating [SnackBar] for 2 seconds
  ///
  /// [context] - current [BuildContext]
  /// [message] - message to show
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
