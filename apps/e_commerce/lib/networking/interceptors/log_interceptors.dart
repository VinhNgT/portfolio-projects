import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Interceptor to log sensitive data using [Logger].
class LoggerIntercepter extends Interceptor {
  const LoggerIntercepter(this.logger);
  final Logger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('Request: ${options.method} ${options.uri}');

    if (options.queryParameters.isNotEmpty) {
      logger.t(options.queryParameters);
    }

    if (options.data != null) {
      logger.t(options.data);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'Response: ${response.requestOptions.method} ${response.realUri} => '
      '${response.statusCode}',
    );
    logger.t(response.data);

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final errName = switch (err) {
      DioException(type: DioExceptionType.cancel) => 'Canceled',
      _ => err.message,
    };

    final buffer = StringBuffer();
    final logContent = [
      err.requestOptions.method,
      err.requestOptions.uri.toString(),
    ];

    for (final string in logContent) {
      if (string.isEmpty) {
        continue;
      }

      if (buffer.isNotEmpty) {
        buffer.write(' ');
      }
      buffer.write(string);
    }

    logger.d(
      'Error: ${buffer.toString()} => '
      '${err.response?.statusCode ?? errName}',
    );

    handler.next(err);
  }
}
