import 'package:driving_license/constants/app_flavor.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_provider.g.dart';

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) {
  final logger = Logger(
    filter: DevelopmentFlavorFilter(),
  );

  ref.onDispose(logger.close);
  return logger;
}

class DevelopmentFlavorFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return appBuiltWithFlavor(AppFlavor.dev) &&
        event.level.value >= level!.value;
  }
}
