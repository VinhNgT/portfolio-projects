import 'package:driving_license/exceptions/app_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_logger.g.dart';

// Generic error logger that logs errors
sealed class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace);
  void logAppException(AppException exception);
}

// A console error logger that logs errors to the console
class ConsoleErrorLogger implements ErrorLogger {
  @override
  void logError(Object error, StackTrace? stackTrace) {
    debugPrint('Error: $error');
    debugPrint('Stack trace: $stackTrace');
  }

  @override
  void logAppException(AppException exception) {
    debugPrint('AppException: $exception');
  }
}

@riverpod
ConsoleErrorLogger consoleErrorLogger(ConsoleErrorLoggerRef ref) {
  return ConsoleErrorLogger();
}
