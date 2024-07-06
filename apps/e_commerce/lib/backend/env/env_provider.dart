import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:e_commerce/backend/env/domain/env.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

@Riverpod(keepAlive: true)
Env env(EnvRef ref) {
  final appCacheConfig = AppCacheConfig.fromSeconds(
    clientCacheDurationSeconds: int.tryParse(
      const String.fromEnvironment('CLIENT_CACHE_DURATION_SECONDS'),
    ),
    networkCacheDurationSeconds: int.tryParse(
      const String.fromEnvironment('NETWORK_CACHE_DURATION_SECONDS'),
    ),
  );

  final loggerLevel = () {
    const logLevel = String.fromEnvironment('LOG_LEVEL', defaultValue: 'debug');
    return Level.values.byName(logLevel);
  }();

  const showDetailedError =
      bool.fromEnvironment('SHOW_DETAILED_ERROR', defaultValue: true);

  return Env(
    appCacheConfig: appCacheConfig,
    loggerLevel: loggerLevel,
    showDetailedError: showDetailedError,
  );
}
