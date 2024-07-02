import 'package:dart_mappable/dart_mappable.dart';

part 'app_cache_config.mapper.dart';

const kDefaultMinCacheDuration = Duration.zero;
const kDefaultMaxCacheDuration = Duration(minutes: 5);

@MappableClass()
class AppCacheConfig with AppCacheConfigMappable {
  AppCacheConfig({
    Duration? minCacheDuration,
    Duration? maxCacheDuration,
  }) {
    this.minCacheDuration = minCacheDuration ?? kDefaultMinCacheDuration;
    this.maxCacheDuration = maxCacheDuration ?? kDefaultMaxCacheDuration;
  }

  AppCacheConfig.fromSeconds({
    required int? minCacheDurationSeconds,
    required int? maxCacheDurationSecond,
  }) : this(
          minCacheDuration: minCacheDurationSeconds != null
              ? Duration(seconds: minCacheDurationSeconds)
              : null,
          maxCacheDuration: maxCacheDurationSecond != null
              ? Duration(seconds: maxCacheDurationSecond)
              : null,
        );

  late final Duration minCacheDuration;
  late final Duration maxCacheDuration;
}
