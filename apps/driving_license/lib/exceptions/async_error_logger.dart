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
    final (Object? error, StackTrace? st) = switch (newValue) {
      // Is EmailPasswordSignInState with AsyncError
      // EmailPasswordSignInState(
      //   formType: _,
      //   value: AsyncError(
      //     :final error,
      //     :final stackTrace,
      //   )
      // ) =>
      //   (error: error, st: stackTrace),

      // Is AsyncError
      AsyncError(error: final error, :final stackTrace) => (error, stackTrace),

      // Is not an error
      _ => (null, null)
    };

    switch (error) {
      // Is AppException
      case (final AppException exception):
        errorLogger.logAppException(exception, st);

      // Is not null
      case _?:
        errorLogger.logError(error, st);
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