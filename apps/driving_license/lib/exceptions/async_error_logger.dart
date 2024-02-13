import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/exceptions/error_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Error logger class to keep track of all AsyncError states that are set
/// by the controllers in the app
class AsyncErrorLogger extends ProviderObserver {
  ErrorLogger errorLogger;

  AsyncErrorLogger(this.errorLogger);

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final error = _findError(newValue);
    if (error != null) {
      if (error.error is AppException) {
        // only prints the AppException data
        errorLogger.logAppException(error.error as AppException);
      } else {
        // prints everything including the stack trace
        errorLogger.logError(error.error, error.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}
