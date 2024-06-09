import 'package:e_commerce/backend/database/sembast_provider.dart';
import 'package:e_commerce/logging/error_logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
abstract class BootstrapDelegate {
  const BootstrapDelegate();

  Future<void> setupServices(ProviderContainer container);
  ErrorLogger getErrorLogger(ProviderContainer container);
}

class ProductionBootstrapDelegate extends BootstrapDelegate {
  const ProductionBootstrapDelegate();

  @override
  Future<void> setupServices(ProviderContainer container) async {
    // Initialize the Sembast database
    await container.read(sembastProvider.future);
  }

  @override
  ErrorLogger getErrorLogger(ProviderContainer container) {
    return container.read(consoleErrorLoggerProvider);
  }
}

class TestBootstrapDelegate extends BootstrapDelegate {
  const TestBootstrapDelegate();

  @override
  Future<void> setupServices(ProviderContainer container) async {
    return;
  }

  @override
  ErrorLogger getErrorLogger(ProviderContainer container) {
    return container.read(consoleErrorLoggerProvider);
  }
}
