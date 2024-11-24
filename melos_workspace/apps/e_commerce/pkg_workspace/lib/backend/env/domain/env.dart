import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:logger/logger.dart';

part 'env.mapper.dart';

@MappableClass()
class Env with EnvMappable {
  const Env({
    required this.appCacheConfig,
    required this.loggerLevel,
    required this.showDetailedError,
  });

  /// The cache configurations that will be used across all caching related
  /// operations and libraries in the app.
  final AppCacheConfig appCacheConfig;

  /// The log level for package logger.
  final Level loggerLevel;

  /// Whether to show detailed error messages to the user.
  final bool showDetailedError;
}
