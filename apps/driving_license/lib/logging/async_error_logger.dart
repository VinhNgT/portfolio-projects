import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/logging/error_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

/// Footnote: First attempt at Flutter 3.0 pattern matching
/// This is confusing as fuck
///
/// Docs:
/// https://dart.dev/language/pattern-types   <- useful
/// https://dart.dev/language/patterns#matching
/// https://dart.dev/language/records   <- basically python tuple