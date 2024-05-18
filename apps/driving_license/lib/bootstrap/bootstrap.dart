import 'dart:ui';

import 'package:driving_license/app.dart';
import 'package:driving_license/bootstrap/bootstrap_delegate.dart';
import 'package:driving_license/constants/app_flavor.dart';
import 'package:driving_license/exceptions/app_error_widget.dart';
import 'package:driving_license/logging/async_error_logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bootstrap {
  final BootstrapDelegate delegate;
  const Bootstrap(this.delegate);

  Future<UncontrolledProviderScope> initApp() async {
    final container = await delegate.createProviderContainer();
    await delegate.setupServices(container);
    setupErrorHandlers(container);

    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  void setupErrorHandlers(ProviderContainer container) {
    final errorLogger = delegate.getErrorLogger(container);

    // Log all asynchronous errors
    container.observers.addAll([
      AsyncErrorLogger(errorLogger),
      // ProviderDebugObserver(),
    ]);

    // Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };

    // Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };

    // Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      final error = details.exception is FlutterError
          ? details.exception as FlutterError
          : null;

      return appBuiltWithFlavor(AppFlavor.dev)
          ? ErrorWidget.withDetails(
              message: details.exceptionAsString(),
              error: error,
            )
          : const AppErrorWidget.production();
    };
  }
}
