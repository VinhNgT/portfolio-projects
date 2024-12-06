import 'package:e_commerce/backend/cache/client_cache_manager_provider.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/cart/data/cart_source.dart';
import 'package:e_commerce/features/cart/data/local_cart_source.dart';
import 'package:e_commerce/networking/interceptors/cache_interceptor_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
abstract class BootstrapDelegate {
  const BootstrapDelegate();

  Future<ProviderContainer> makeAppContainer(ProviderContainer rootContainer);
  Future<void> setupServices(ProviderContainer container);
}

class ProductionBootstrapDelegate extends BootstrapDelegate {
  const ProductionBootstrapDelegate();

  @override
  Future<ProviderContainer> makeAppContainer(
    ProviderContainer rootContainer,
  ) async {
    final driftDb = rootContainer.read(driftDefaultLocalDatabaseProvider);

    final container = ProviderContainer(
      overrides: [
        localCartSourceProvider.overrideWithValue(
          await LocalCartSource.makeDefault(driftDb, localCartSourceId),
        ),
      ],
    );

    return container;
  }

  @override
  Future<void> setupServices(ProviderContainer container) async {
    // container.read(keyboardVisibilityProvider);

    await container.read(clientCacheManagerProvider.future);
    await container.read(dioCacheInterceptorProvider.future);
  }
}

class TestBootstrapDelegate extends BootstrapDelegate {
  const TestBootstrapDelegate();

  @override
  Future<ProviderContainer> makeAppContainer(
    ProviderContainer rootContainer,
  ) async {
    final container = ProviderContainer();
    return container;
  }

  @override
  Future<void> setupServices(ProviderContainer container) async {
    return;
  }
}
