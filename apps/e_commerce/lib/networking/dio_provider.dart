import 'package:dio/dio.dart';
import 'package:e_commerce/constants/app_flavors.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// Provider of a [Dio] instance for connecting to https://dummyjson.com API.
@Riverpod(keepAlive: true)
Dio dummyJsonDio(DummyJsonDioRef ref) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://dummyjson.com'),
  );
  final logger = ref.watch(loggerProvider);

  dio.interceptors.addAll([
    LogInterceptor(
      // LogInterceptor by default only logs when in debug mode. We change it to
      // always log when the app is not in production.
      logPrint: (object) {
        if (appFlavor != AppFlavors.production) {
          debugPrint(object.toString());
        }
      },
    ),
    DataLogIntercepter(logger),
  ]);

  ref.onDispose(dio.close);
  return dio;
}

/// Interceptor to log sensitive data using [Logger].
class DataLogIntercepter extends Interceptor {
  const DataLogIntercepter(this.logger);
  final Logger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.queryParameters.isNotEmpty) {
      debugPrint('Query Parameters:');
      logger.i(options.queryParameters);
    }

    if (options.data != null) {
      debugPrint('Request Data:');
      logger.i(options.data);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response Data:');
    logger.i(response);

    handler.next(response);
  }
}
