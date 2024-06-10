import 'dart:ui';

import 'package:e_commerce/app.dart';
import 'package:e_commerce/bootstrap/bootstrap_delegate.dart';
import 'package:e_commerce/constants/app_flavors.dart';
import 'package:e_commerce/exceptions/app_error_widget.dart';
import 'package:e_commerce/logging/async_error_logger.dart';
import 'package:e_commerce/logging/error_logger.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bootstrap {
  const Bootstrap(this.delegate);
  final BootstrapDelegate delegate;

  Future<UncontrolledProviderScope> initApp() async {
    final container = ProviderContainer();
    await delegate.setupServices(container);
    setupErrorHandlers(container);

    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  void setupErrorHandlers(ProviderContainer container) {
    final appErrorLogger = ErrorLogger(container.read(loggerProvider));

    // Log all Riverpod asynchronous errors
    container.observers.addAll([
      AsyncErrorLogger(appErrorLogger),
    ]);

    // Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      appErrorLogger.log(details.exception, details.stack);
    };

    // Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      appErrorLogger.log(error, stack);
      return true;
    };

    // Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      final error = details.exception is FlutterError
          ? details.exception as FlutterError
          : null;

      return appFlavor == AppFlavors.production
          ? const AppErrorWidget()
          : ErrorWidget.withDetails(
              message: details.exceptionAsString(),
              error: error,
            );
    };
  }
}
