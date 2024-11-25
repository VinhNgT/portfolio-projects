import 'package:dio/dio.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:e_commerce/networking/interceptors/cache_interceptor_provider.dart';
import 'package:e_commerce/networking/interceptors/log_interceptors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// Provider of a [Dio] instance for connecting to https://dummyjson.com API.
@Riverpod(keepAlive: true)
Dio dummyJsonDio(Ref ref) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://dummyjson.com'),
  );

  final logger = ref.watch(loggerProvider);
  final cacheInterceptor = ref.watch(dioCacheInterceptorProvider).requireValue;

  dio.interceptors.addAll([
    LoggerIntercepter(logger),
    cacheInterceptor,
  ]);

  ref.onDispose(dio.close);
  return dio;
}
