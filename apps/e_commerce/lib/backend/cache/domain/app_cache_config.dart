import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/mappers/duration_seconds_mapper.dart';

part 'app_cache_config.mapper.dart';

const kDefaultClientCacheDuration = Duration(minutes: 5);
const kDefaultNetworkCacheDuration = Duration(minutes: 5);

/// The cache configurations that will be used across all caching related
/// operations and libraries in the app.
@MappableClass(
  includeCustomMappers: [DurationSecondsMapper()],
)
class AppCacheConfig with AppCacheConfigMappable {
  AppCacheConfig({
    Duration? clientCacheDuration,
    Duration? networkCacheDuration,
  }) {
    this.clientCacheDuration =
        clientCacheDuration ?? kDefaultClientCacheDuration;
    this.networkCacheDuration =
        networkCacheDuration ?? kDefaultNetworkCacheDuration;
  }

  factory AppCacheConfig.fromSeconds({
    int? clientCacheDurationSeconds,
    int? networkCacheDurationSeconds,
  }) {
    return AppCacheConfig(
      clientCacheDuration: clientCacheDurationSeconds != null
          ? Duration(seconds: clientCacheDurationSeconds)
          : null,
      networkCacheDuration: networkCacheDurationSeconds != null
          ? Duration(seconds: networkCacheDurationSeconds)
          : null,
    );
  }

  /// The max cache duration of client generated data. Defaults to
  /// [kDefaultClientCacheDuration]
  late final Duration clientCacheDuration;

  /// The max cache duration of network fetched data. Defaults to
  /// [kDefaultNetworkCacheDuration]
  late final Duration networkCacheDuration;
}
