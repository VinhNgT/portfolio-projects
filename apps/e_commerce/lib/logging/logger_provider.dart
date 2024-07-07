import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/logging/log_outputs/level_console_output.dart';
import 'package:e_commerce/logging/printers/lower_level_hybird_printer.dart';
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
    printer: LowerLevelHybridPrinter(
      lowerPrinter: SimplePrinter(),
      normalPrinter: PrettyPrinter(
        methodCount: 1,
        excludePaths: [
          'package:e_commerce/logging',
        ],
        printEmojis: false,
      ),
      evalLevel: Level.info,
    ),
    output: MultiOutput([
      LevelConsoleOutput(logLevel),
      // Todo: Implement firebase crashlytics
    ]),
  );

  ref.onDispose(logger.close);
  return logger;
}
