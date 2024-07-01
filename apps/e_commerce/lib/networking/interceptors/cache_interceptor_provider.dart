import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_objectbox_store/dio_cache_interceptor_objectbox_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_interceptor_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<DioCacheInterceptor> dioCacheInterceptor(
  DioCacheInterceptorRef ref,
) async {
  final cacheDir = await getApplicationCacheDirectory();
  final cacheOptions = CacheOptions(
    store: ObjectBoxCacheStore(storePath: cacheDir.path),
  );

  return DioCacheInterceptor(options: cacheOptions);
}
