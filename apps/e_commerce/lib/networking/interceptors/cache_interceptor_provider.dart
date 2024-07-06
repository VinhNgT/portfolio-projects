import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:e_commerce/backend/cache/domain/app_cache_config.dart';
import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_interceptor_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<DioCacheInterceptor> dioCacheInterceptor(
  DioCacheInterceptorRef ref,
) async {
  final appCacheConfig =
      ref.watch(envProvider.select((env) => env.appCacheConfig));

  // final cacheDir = await getApplicationCacheDirectory();
  // final cacheOptions = CacheOptions(
  //   store: ObjectBoxCacheStore(storePath: cacheDir.path),
  // );
  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
  );

  return DioAppCacheInterceptor(
    appCacheConfig,
    options: cacheOptions,
  );
}

/// A [DioCacheInterceptor] that adds app specific cache control headers to the
/// request.
class DioAppCacheInterceptor extends DioCacheInterceptor {
  /// Creates a new instance of [DioAppCacheInterceptor].
  ///
  /// Parameters:
  ///   - [cacheConfig] - App specific configuration settings [AppCacheConfig]
  ///     for the cache. These settings are typically obtained from
  ///     [envProvider].
  ///   - [options] - An instance of [CacheOptions] that specifies various
  ///     options for caching behavior. These options are passed to the
  ///     superclass
  DioAppCacheInterceptor(
    this.cacheConfig, {
    required super.options,
  });

  final AppCacheConfig? cacheConfig;
  final _cacheControlHeader = 'cache-control';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final reqCacheCtl = CacheControl.fromHeader(
      _headerValuesAsList(options.headers, _cacheControlHeader),
    );

    final cacheReqCacheCtl = reqCacheCtl.maxAge == -1
        ? reqCacheCtl.copyWith(
            maxAge: cacheConfig?.networkCacheDuration.inSeconds,
          )
        : reqCacheCtl;

    options.headers[_cacheControlHeader] = cacheReqCacheCtl.toHeader();
    return super.onRequest(options, handler);
  }

  List<String>? _headerValuesAsList(
    Map<String, dynamic> headers,
    String headerKey,
  ) {
    final value = headers[headerKey];

    if (value is List<String>) {
      return value;
    }
    if (value is String) {
      return value.split(',');
    }

    return value;
  }
}

extension _CacheControlExtension on CacheControl {
  CacheControl copyWith({
    int? maxAge,
    int? maxStale,
    int? minFresh,
    bool? mustRevalidate,
    String? privacy,
    bool? noCache,
    bool? noStore,
    List<String>? other,
  }) {
    return CacheControl(
      maxAge: maxAge ?? this.maxAge,
      maxStale: maxStale ?? this.maxStale,
      minFresh: minFresh ?? this.minFresh,
      mustRevalidate: mustRevalidate ?? this.mustRevalidate,
      privacy: privacy ?? this.privacy,
      noCache: noCache ?? this.noCache,
      noStore: noStore ?? this.noStore,
      other: other ?? this.other,
    );
  }
}
