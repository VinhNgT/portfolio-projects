import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_cache_config.freezed.dart';
part 'app_cache_config.g.dart';

const kDefaultCacheDuration = Duration(minutes: 5);
const kDefaultCacheStorageDuration = Duration(minutes: 30);

@freezed
class AppCacheConfig with _$AppCacheConfig {
  const factory AppCacheConfig({
    @Default(kDefaultCacheDuration) Duration cacheDuration,
    @Default(kDefaultCacheStorageDuration) Duration storageDuration,
  }) = _AppCacheConfig;

  factory AppCacheConfig.fromJson(Map<String, dynamic> json) =>
      _$AppCacheConfigFromJson(json);

  factory AppCacheConfig.fromSeconds({
    int? cacheDurationSeconds,
    int? storageDurationSeconds,
  }) {
    return AppCacheConfig(
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
