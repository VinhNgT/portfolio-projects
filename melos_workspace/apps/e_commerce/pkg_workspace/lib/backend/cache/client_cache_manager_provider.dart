import 'dart:async';

import 'package:cached_query/cached_query.dart';
import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:e_commerce/backend/cache/drift_cache_database.dart';
import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/backend/utils/object_serializer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_cache_manager_provider.g.dart';

class ClientCacheManager {
  const ClientCacheManager(this.cachedQuery);
  final CachedQuery cachedQuery;

  /// Queries the cache with the given [key]. If the cache is empty or expired,
  /// it will call [queryFn] to fetch the data.
  ///
  /// If a [serializer] is provided, it will be used to serialize and
  /// deserialize the data for storage. Otherwise, `jsonEncode` and `jsonDecode`
  /// will be used.
  ///
  /// [cacheError] - Determines if the error thrown by [queryFn] should be
  /// cached. Defaults to `false`.
  ///
  /// [neverExpire] - Whether to keep the cache indefinitely. Defaults to
  /// `false`.
  ///
  /// [forceRefresh] - Force fetching new data from [queryFn], ignore existing
  /// cache and [neverExpire] flag. Defaults to `false`.
  ///
  /// [ramCacheDuration] - Specifies the time to keep the cache in RAM
  /// (temporary, in-memory storage). The duration is refreshed every time the
  /// data is accessed, allowing the cached data to potentially remain in RAM
  /// longer than it does in the persistent storage. Defaults to
  /// [Duration.zero].
  ///
  /// [cacheDuration] - Specifies the time to keep the cache on disk (persistent
  /// storage). This duration cannot be refreshed and the cache will be removed
  /// and refetched on next call. Defaults to [kDefaultClientCacheDuration],
  /// which can be changed using [AppCacheConfig.clientCacheDuration] in [env].
  Future<T> query<T extends Object>({
    required String key,
    required FutureOr<T> Function() queryFn,
    ObjectSerializer<T>? serializer,
    bool cacheError = false,
    bool neverExpire = false,
    bool forceRefresh = false,
    Duration? ramCacheDuration,
    Duration? cacheDuration,
  }) async {
    // CachedQuery does not automatically remove expired cache from the
    // persistent storage, so we need to do it manually.
    await _clearExpiredCache(key, force: forceRefresh);

    final query = Query<T>(
      key: key,
      queryFn: () async => queryFn(),
      config: QueryConfig(
        storageSerializer:
            serializer != null ? (object) => serializer.toJson(object) : null,
        storageDeserializer:
            serializer != null ? (json) => serializer.fromJson(json) : null,
        cacheDuration: ramCacheDuration,
        storageDuration: cacheDuration,
        ignoreCacheDuration: neverExpire,
      ),
    );

    final result = await query.result;
    if (result.status == QueryStatus.error) {
      if (!cacheError) {
        cachedQuery.deleteCache(key: key);
      }
      throw result.error;
    }

    return result.data!;
  }

  Future<void> _clearExpiredCache(String key, {bool force = false}) async {
    final query = cachedQuery.getQuery(key);
    if (query == null) {
      return;
    }

    if (force) {
      cachedQuery.deleteCache(key: key, deleteStorage: true);
      return;
    }

    final QueryState cachedResult = await query.result;
    if (query.config.storageDuration != null &&
        cachedResult.timeCreated
            .add(query.config.storageDuration!)
            .isBefore(DateTime.now())) {
      cachedQuery.deleteCache(key: key, deleteStorage: true);
    }
  }
}

/// Provides a [ClientCacheManager] instance.
@Riverpod(keepAlive: true)
Future<ClientCacheManager> clientCacheManager(Ref ref) async {
  // Grab the cache configuration from the environment variables.
  final AppCacheConfig cacheConfig = ref.watch(envProvider).appCacheConfig;

  // Configure CachedQuery backend.
  final cachedQuery = CachedQuery.instance;
  cachedQuery.config(
    storage: DriftCachedStorage(),

    // Default configuration for all queries.
    config: QueryConfig(
      // Do not refetch the data in background.
      shouldRefetch: (p0, afterStorage) => false,

      // Time to keep the cache in RAM, it will be refreshed every time the data
      // is accessed.
      //
      // Set to Duration.zero to disable RAM cache.
      cacheDuration: Duration.zero,

      // Time to keep the cache in disk. The cache will be deleted after this
      // duration.
      storageDuration: cacheConfig.clientCacheDuration,
    ),
  );

  return ClientCacheManager(cachedQuery);
}
