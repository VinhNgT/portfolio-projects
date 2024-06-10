import 'package:e_commerce/bootstrap/bootstrap.dart';
import 'package:e_commerce/logging/error_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Riverpod error logger class to keep track of all AsyncError states that are
/// set by providers in the app.
///
/// Should be added to [ProviderContainer.observers] via [Bootstrap] when app
/// starts.
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
      errorLogger.log(error, stackTrace);
    }
  }
}
