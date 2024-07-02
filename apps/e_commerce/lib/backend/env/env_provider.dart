import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

class Env {
  /// The cache configurations that will be used across all caching related
  /// operations and libraries in the app.
  final AppCacheConfig appCacheConfig = () {
    return AppCacheConfig.fromSeconds(
      minCacheDurationSeconds: int.tryParse(
        const String.fromEnvironment('MIN_CACHE_DURATION_SECONDS'),
      ),
      maxCacheDurationSecond: int.tryParse(
        const String.fromEnvironment('MAX_CACHE_DURATION_SECONDS'),
      ),
    );
  }();

  final Level loggerLevel = () {
    const logLevel = String.fromEnvironment('LOG_LEVEL', defaultValue: 'debug');
    return Level.values.byName(logLevel);
  }();

  final showDetailedError =
      const bool.fromEnvironment('SHOW_DETAILED_ERROR', defaultValue: true);
}

@Riverpod(keepAlive: true)
Env env(EnvRef ref) {
  return Env();
}
