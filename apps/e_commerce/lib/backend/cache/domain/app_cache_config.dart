import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cache_config.freezed.dart';
part 'app_cache_config.g.dart';

const kDefaultMinCacheDuration = Duration(minutes: 5);
const kDefaultMaxCacheDuration = Duration(minutes: 30);

@freezed
class AppCacheConfig with _$AppCacheConfig {
  const factory AppCacheConfig({
    /// Minimum cache duration
    @Default(kDefaultMinCacheDuration)
    @DurationSecondsConverter()
    Duration minCacheDuration,

    /// Maximum cache duration
    @Default(kDefaultMaxCacheDuration)
    @DurationSecondsConverter()
    Duration maxCacheDuration,
  }) = _AppCacheConfig;

  factory AppCacheConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCacheConfigFromJson(json);

  factory AppCacheConfig.fromSeconds({
    int? minCacheDurationSeconds,
    int? maxCacheDurationSecond,
  }) {
    return AppCacheConfig.fromJson({
      'minCacheDuration': minCacheDurationSeconds,
      'maxCacheDuration': maxCacheDurationSecond,
    });
  }
}

class DurationSecondsConverter implements JsonConverter<Duration, int> {
  const DurationSecondsConverter();

  @override
  Duration fromJson(int seconds) => Duration(seconds: seconds);

  @override
  int toJson(Duration duration) => duration.inSeconds;
}
