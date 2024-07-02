import 'package:dart_mappable/dart_mappable.dart';

part 'app_cache_config.mapper.dart';

const kDefaultClientCacheDuration = Duration(minutes: 5);
const kDefaultNetworkCacheDuration = Duration(minutes: 5);

@MappableClass()
class AppCacheConfig with AppCacheConfigMappable {
  AppCacheConfig({
    Duration? clientCacheDuration,
    Duration? networkCacheDuration,
  }) {
    clientCacheDuration = clientCacheDuration ?? kDefaultClientCacheDuration;
    networkCacheDuration = networkCacheDuration ?? kDefaultNetworkCacheDuration;
  }

  AppCacheConfig.fromSeconds({
    required int? clientCacheDurationSeconds,
    required int? networkCacheDurationSecond,
  }) : this(
          clientCacheDuration: clientCacheDurationSeconds != null
              ? Duration(seconds: clientCacheDurationSeconds)
              : null,
          networkCacheDuration: networkCacheDurationSecond != null
              ? Duration(seconds: networkCacheDurationSecond)
              : null,
        );

  /// The max cache duration of client generated data.
  late final Duration clientCacheDuration;

  /// The max cache duration of network fetched data.
  late final Duration networkCacheDuration;
}
