import 'package:driving_license/backend/ads/admob_provider.dart';
import 'package:driving_license/backend/database/sembast_provider.dart';
import 'package:driving_license/backend/database/sqlite_provider.dart';
import 'package:driving_license/backend/env/application/env_provider.dart';
import 'package:driving_license/backend/in_app_purchase/iap_service.dart';
import 'package:driving_license/backend/remote_config/application/remote_config_providers.dart';
import 'package:driving_license/backend/remote_config/firebase_remote_config.dart';
import 'package:driving_license/backend/shared_preferences/share_preferences_provider.dart';
import 'package:driving_license/firebase_options.dart';
import 'package:driving_license/logging/error_logger.dart';
import 'package:firebase_core/firebase_core.dart';
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
    container.read(envProvider);

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await container.read(firebaseRemoteConfigFutureProvider.future);
    await container.read(remoteConfigDataFutureProvider.future);
    container.listen(remoteConfigDataFutureProvider.future, (_, __) {});

    // Initialize AdMob
    container.read(adMobProvider);

    // Initialize shared preferences
    await container.read(sharedPreferencesProvider.future);

    // Initialize the SQLite database
    await container.read(sqliteProvider.future);

    // Initialize the Sembast database
    await container.read(sembastProvider.future);

    // Initialize in-app purchase service
    container.read(iapServiceProvider);
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
