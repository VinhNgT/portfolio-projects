const kDefaultCacheDuration = Duration(minutes: 5);
const kDefaultCacheStorageDuration = Duration(minutes: 30);

class CacheConfig {
  CacheConfig({
    int? cacheDurationSeconds,
    int? storageDurationSeconds,
  }) {
    cacheDuration = Duration(
      seconds: cacheDurationSeconds ?? kDefaultCacheDuration.inSeconds,
    );
    storageDuration = Duration(
      seconds: storageDurationSeconds ?? kDefaultCacheStorageDuration.inSeconds,
    );
  }

  late final Duration cacheDuration;
  late final Duration storageDuration;
}
