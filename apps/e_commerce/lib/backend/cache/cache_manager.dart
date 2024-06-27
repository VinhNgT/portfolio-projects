import 'dart:async';

import 'package:cached_query/cached_query.dart';
import 'package:e_commerce/backend/cache/cache_storage.dart';
import 'package:e_commerce/backend/utils/object_serializer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_manager.g.dart';

class CacheManager {
  CacheManager(this.cachedQuery);
  final CachedQuery cachedQuery;

  /// Queries the cache with the given [key], if the cache is empty or expired,
  /// it will call [queryFn] to fetch the data.
  ///
  /// If [serializer] is provided, it will be used to serialize and deserialize
  /// the data for storage. Otherwise, jsonEncode and jsonDecode will be used.
  Future<T> query<T extends Object>({
    required String key,
    required FutureOr<T> Function() queryFn,
    ObjectSerializer<T>? serializer,
  }) async {
    final query = Query<T>(
      key: key,
      queryFn: () async => queryFn(),
      config: QueryConfig(
        storageSerializer:
            serializer != null ? (object) => serializer.toJson(object) : null,
        storageDeserializer:
            serializer != null ? (json) => serializer.fromJson(json) : null,
      ),
    );

    final result = await query.result;
    if (result.status == QueryStatus.error) {
      throw result.error;
    }

    return result.data!;
  }
}

/// Provides a [CacheManager] instance.
@Riverpod(keepAlive: true)
Future<CacheManager> cacheManager(CacheManagerRef ref) async {
  final cachedQuery = CachedQuery.instance;
  cachedQuery.config(
    storage: await SembastCachedStorage.makeDefault(),

    // Default configuration for all queries
    config: QueryConfig(
      // Do not refetch the data in background
      shouldRefetch: (p0, afterStorage) => false,

      // Time to keep the cache in disk
      storageDuration: const Duration(minutes: 5),

      // Time to keep the cache in RAM
      cacheDuration: const Duration(minutes: 1),
    ),
  );

  return CacheManager(cachedQuery);
}
