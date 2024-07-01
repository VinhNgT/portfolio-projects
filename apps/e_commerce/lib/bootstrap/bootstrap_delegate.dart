import 'package:e_commerce/backend/cache/client_cache_manager_provider.dart';
import 'package:e_commerce/backend/database/sembast_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
abstract class BootstrapDelegate {
  const BootstrapDelegate();

  Future<void> setupServices(ProviderContainer container);
}

class ProductionBootstrapDelegate extends BootstrapDelegate {
  const ProductionBootstrapDelegate();

  @override
  Future<void> setupServices(ProviderContainer container) async {
    // Initialize the Sembast database
    await container.read(sembastProvider.future);

    // Initialize CachedQuery
    await container.read(clientCacheManagerProvider.future);
  }
}

class TestBootstrapDelegate extends BootstrapDelegate {
  const TestBootstrapDelegate();

  @override
  Future<void> setupServices(ProviderContainer container) async {
    return;
  }
}
