import 'package:e_commerce/constants/app_flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_provider.g.dart';

/// Provides an instance of [Logger].
///
/// All errors, exceptions, and events in the app should be logged using this
/// [Logger] instance.
@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) {
  final logger = Logger(
    filter: DevelopmentFlavorFilter(),
    output: MultiOutput([
      LevelConsoleOutput(Level.info),
      // Todo: Implement firebase crashlytics
    ]),
  );

  ref.onDispose(logger.close);
  return logger;
}

/// A filter that only logs messages if the app is not in production mode.
class DevelopmentFlavorFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return (appFlavor != AppFlavors.production) &&
        event.level.value >= level!.value;
  }
}

/// A [LogOutput] implementation that outputs log messages to the console based
/// on the specified log level.
class LevelConsoleOutput extends LogOutput {
  LevelConsoleOutput(this.level);

  /// The log level to filter log messages.
  final Level level;

  @override
  void output(OutputEvent event) {
    if (event.level.value >= level.value) {
      event.lines.forEach(debugPrint);
    }
  }
}
