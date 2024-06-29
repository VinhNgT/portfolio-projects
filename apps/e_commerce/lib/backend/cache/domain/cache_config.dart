import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_config.freezed.dart';
part 'cache_config.g.dart';

const kDefaultCacheDuration = Duration(minutes: 5);
const kDefaultCacheStorageDuration = Duration(minutes: 30);

@freezed
class CacheConfig with _$CacheConfig {
  const factory CacheConfig({
    @Default(kDefaultCacheDuration) Duration cacheDuration,
    @Default(kDefaultCacheStorageDuration) Duration storageDuration,
  }) = _CacheConfig;

  factory CacheConfig.fromJson(Map<String, dynamic> json) =>
      _$CacheConfigFromJson(json);

  factory CacheConfig.fromSeconds({
    int? cacheDurationSeconds,
    int? storageDurationSeconds,
  }) {
    return CacheConfig(
      cacheDuration: Duration(
        seconds: cacheDurationSeconds ?? kDefaultCacheDuration.inSeconds,
      ),
      storageDuration: Duration(
        seconds:
            storageDurationSeconds ?? kDefaultCacheStorageDuration.inSeconds,
      ),
    );
  }
}
