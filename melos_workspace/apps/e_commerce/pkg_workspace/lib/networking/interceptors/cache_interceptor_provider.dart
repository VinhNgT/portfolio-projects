import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_interceptor_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<DioCacheInterceptor> dioCacheInterceptor(
  DioCacheInterceptorRef ref,
) async {
  final appCacheConfig =
      ref.watch(envProvider.select((env) => env.appCacheConfig));

  final cacheDir = await getApplicationCacheDirectory();
  final cacheOptions = CacheOptions(
    store: DbCacheStore(databasePath: cacheDir.path),
  );

  return DioAppCacheInterceptor(
    appCacheConfig,
    cacheOptions: cacheOptions,
  );
}

/// A [DioCacheInterceptor] that adds app specific cache control headers to the
/// request.
class DioAppCacheInterceptor extends DioCacheInterceptor {
  /// Creates a new instance of [DioAppCacheInterceptor].
  ///
  /// Parameters:
  ///   - [appCacheConfig] - App specific configuration settings for the cache,
  ///     these settings are typically obtained from [envProvider].
  ///   - [cacheOptions] - An instance of [CacheOptions] that specifies various
  ///     options for caching behavior, these options are passed to the
  ///     superclass.
  DioAppCacheInterceptor(
    this.appCacheConfig, {
    required this.cacheOptions,
  }) : super(options: cacheOptions);

  final AppCacheConfig? appCacheConfig;
  final CacheOptions cacheOptions;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final appCacheDuration = appCacheConfig?.networkCacheDuration;

    /// If the app does not have a cache configuration, then we do not need to
    /// do anything here, let the parent handle it.
    if (appCacheDuration == null) {
      return super.onRequest(options, handler);
    }

    final key = cacheOptions.keyBuilder(options);
    final cache = await cacheOptions.store?.get(key);

    if (cache != null &&
        cache.responseDate.add(appCacheDuration).isAfter(DateTime.now())) {
      return handler.resolve(
        cache.toResponse(options, fromNetwork: false),
        true,
      );
    }

    return super.onRequest(options, handler);
  }
}
