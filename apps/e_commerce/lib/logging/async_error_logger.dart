import 'package:e_commerce/exceptions/app_exceptions.dart';
import 'package:e_commerce/logging/error_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Error logger class to keep track of all AsyncError states that are set
/// by the controllers in the app
class AsyncErrorLogger extends ProviderObserver {
  AsyncErrorLogger(this.errorLogger);
  ErrorLogger errorLogger;

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue case AsyncError(:final error, :final stackTrace)) {
      switch (error) {
        case (final AppException exception):
          errorLogger.logAppException(exception, stackTrace);

        case _:
          errorLogger.logError(error, stackTrace);
      }
    }
  }
}
