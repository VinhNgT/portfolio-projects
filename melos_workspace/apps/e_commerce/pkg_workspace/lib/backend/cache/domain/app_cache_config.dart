import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/mappers/duration_seconds_mapper.dart';

part 'app_cache_config.mapper.dart';

const Duration kDefaultClientCacheDuration = Duration(minutes: 5);

/// The cache configurations that will be used across all caching related
/// operations and libraries in the app.
@MappableClass(
  includeCustomMappers: [DurationSecondsMapper()],
)
class AppCacheConfig with AppCacheConfigMappable {
  AppCacheConfig({
    Duration? clientCacheDuration,
    this.networkCacheDuration,
  }) {
    this.clientCacheDuration =
        clientCacheDuration ?? kDefaultClientCacheDuration;
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

  /// The cache duration of client generated data. Defaults to
  /// [kDefaultClientCacheDuration]
  late final Duration clientCacheDuration;

  /// The cache duration for network fetched data.
  ///
  /// - `null` means let server decide the cache duration.
  /// - A [Duration] value means the cache expiration should depend on both how
  ///   the server want and this duration, whichever comes first.
  final Duration? networkCacheDuration;
}
