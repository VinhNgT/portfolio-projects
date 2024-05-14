import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/logging/logger_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_logger.g.dart';

// Generic error logger that logs errors
@immutable
sealed class ErrorLogger {
  const ErrorLogger();

  void logError(Object error, StackTrace? stackTrace);
  void logAppException(AppException exception, StackTrace? stackTrace);
}

// A console error logger that logs errors to the console
class ConsoleErrorLogger extends ErrorLogger {
  final Logger logger;
  const ConsoleErrorLogger(this.logger);

  @override
  void logError(Object error, StackTrace? stackTrace) {
    logger.e('Unexpencted error', error: error, stackTrace: stackTrace);
  }

  @override
  void logAppException(AppException exception, StackTrace? stackTrace) {
    logger.w('App exception', error: exception, stackTrace: stackTrace);
  }
}

@riverpod
ConsoleErrorLogger consoleErrorLogger(ConsoleErrorLoggerRef ref) {
  final logger = ref.watch(loggerProvider);
  return ConsoleErrorLogger(logger);
}
