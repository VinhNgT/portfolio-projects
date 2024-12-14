import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:logger/logger.dart';

part 'env_data.mapper.dart';

@MappableClass()
class EnvData with EnvDataMappable {
  /// The cache configurations that will be used across all caching related
  /// operations and libraries in the app.
  final AppCacheConfig appCacheConfig;

  /// The log level for package logger.
  final Level loggerLevel;

  /// Whether to show detailed error messages to the user.
  final bool showDetailedError;

  /// Whether to rebuild the local database on app startup. All data will be
  /// lost.
  final bool rebuildLocalDatabaseOnStartup;

  /// Whether to fill the local database with test data on startup.
  final bool fillLocalDatabaseWithTestDataOnStartup;

  const EnvData({
    required this.appCacheConfig,
    required this.loggerLevel,
    required this.showDetailedError,
    required this.rebuildLocalDatabaseOnStartup,
    required this.fillLocalDatabaseWithTestDataOnStartup,
  });

  factory EnvData.fromEnviroment() {
    return EnvData(
      appCacheConfig: AppCacheConfig.fromSeconds(
        clientCacheDurationSeconds: int.tryParse(
          const String.fromEnvironment('CLIENT_CACHE_DURATION_SECONDS'),
        ),
        networkCacheDurationSeconds: int.tryParse(
          const String.fromEnvironment('NETWORK_CACHE_DURATION_SECONDS'),
        ),
      ),
      loggerLevel: Level.values.byName(
        const String.fromEnvironment('LOG_LEVEL', defaultValue: 'debug'),
      ),
      showDetailedError:
          const bool.fromEnvironment('SHOW_DETAILED_ERROR', defaultValue: true),
      rebuildLocalDatabaseOnStartup: const bool.fromEnvironment(
        'REBUILD_LOCAL_DATABASE_ON_STARTUP',
        defaultValue: false,
      ),
      fillLocalDatabaseWithTestDataOnStartup: const bool.fromEnvironment(
        'FILL_LOCAL_DATABASE_WITH_TEST_DATA_ON_STARTUP',
        defaultValue: false,
      ),
    );
  }
}
