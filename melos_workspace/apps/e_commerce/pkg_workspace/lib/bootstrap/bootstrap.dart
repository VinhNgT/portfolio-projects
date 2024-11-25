import 'dart:async';
import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/app.dart';
import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/bootstrap/bootstrap_delegate.dart';
import 'package:e_commerce/exceptions/widgets/app_error_widget.dart';
import 'package:e_commerce/logging/error_loggers/async_error_logger.dart';
import 'package:e_commerce/logging/error_loggers/error_logger.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:e_commerce/mappers/logger_level.mapper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bootstrap {
  const Bootstrap(this.delegate);
  final BootstrapDelegate delegate;

  Future<UncontrolledProviderScope> initApp() async {
    setupMappers();

    final container = ProviderContainer();
    final errorLogger = ErrorLogger(container.read(loggerProvider));
    setupErrorHandlers(container, errorLogger);

    container.listen(envPrintWatcherProvider, (_, __) {});

    await runZonedGuarded(() async {
      await delegate.setupServices(container);
    }, (error, stackTrace) {
      errorLogger.log(
        source: ErrorSource.bootstrap,
        error: error,
        stackTrace: stackTrace,
      );
    });

    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  void setupMappers() {
    MapperContainer.globals.use(const LoggerLevelMapper());
  }

  void setupErrorHandlers(
    ProviderContainer container,
    ErrorLogger errorLogger,
  ) {
    final showDetailedError = container.read(envProvider).showDetailedError;

    // Log all Riverpod asynchronous errors
    container.observers.addAll([
      AsyncErrorLogger(errorLogger),
    ]);

    // Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      Future(() async {
        FlutterError.presentError(details);
        // Wait for the previous command to finish
        await Future.delayed(const Duration(milliseconds: 10));
        errorLogger.log(
          source: ErrorSource.flutter,
          error: details.exception,
          stackTrace: details.stack,
        );
      });
    };

    // Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.log(
        source: ErrorSource.rootIsolate,
        error: error,
        stackTrace: stack,
      );
      return true;
    };

    // Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      final error = details.exception is FlutterError
          ? details.exception as FlutterError
          : null;

      return showDetailedError
          ? ErrorWidget.withDetails(
              message: details.exceptionAsString(),
              error: error,
            )
          : const AppErrorWidget();
    };
  }
}
