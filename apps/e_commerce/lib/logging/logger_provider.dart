import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_provider.g.dart';

/// Provides an instance of [Logger].
///
/// All errors, exceptions, and events in the app should be logged using this
/// [Logger] instance.
@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) {
  final logLevel = ref.watch(envProvider).loggerLevel;

  final logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(
      methodCount: 1,
      printEmojis: false,
    ),
    output: MultiOutput([
      LevelConsoleOutput(logLevel),
      // Todo: Implement firebase crashlytics
    ]),
  );

  ref.onDispose(logger.close);
  return logger;
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
