import 'package:driving_license/exceptions/app_exception.dart';
import 'package:logger/logger.dart';

enum ErrorSource {
  flutter('Flutter framework exception'),
  riverpodProvider('Riverpod provider exception'),
  rootIsolate('Root isolate exception'),
  bootstrap('Bootstrap exception');

  const ErrorSource(this._message);
  final String _message;

  @override
  String toString() => _message;
}

/// A logger that logs all errors and exceptions in the app.
class ErrorLogger {
  ErrorLogger(this.logger);
  final Logger logger;

  void log({
    required ErrorSource source,
    required Object error,
    StackTrace? stackTrace,
  }) {
    switch (error) {
      case (final AppException exception):
        logger.w(
          source,
          error: exception,
          stackTrace: stackTrace,
        );

      case _:
        logger.e(
          source,
          error: error,
          stackTrace: stackTrace,
        );
    }
  }
}
