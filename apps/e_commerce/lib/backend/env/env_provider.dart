import 'package:e_commerce/backend/cache/domain/cache_config.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

class Env {
  final CacheConfig cacheConfig = () {
    const cacheDuration = String.fromEnvironment('CACHE_DURATION_SECONDS');
    const storageDuration =
        String.fromEnvironment('CACHE_STORAGE_DURATION_SECONDS');
    return CacheConfig(
      cacheDurationSeconds: int.tryParse(cacheDuration),
      storageDurationSeconds: int.tryParse(storageDuration),
    );
  }();

  final Level loggerLevel = () {
    const logLevel = String.fromEnvironment('LOG_LEVEL');
    return Level.values.firstWhere(
      (e) => e.name == logLevel,
      orElse: () => Level.info,
    );
  }();
}

@Riverpod(keepAlive: true)
Env env(EnvRef ref) {
  return Env();
}
