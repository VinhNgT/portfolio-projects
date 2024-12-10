import 'package:e_commerce/backend/env/domain/env_data.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

@Riverpod(keepAlive: true)
EnvData env(Ref ref) {
  return EnvData.fromEnviroment();
}

/// This provider prints the current environment variables to the console.
///
/// We must use a separate provider for this because if we use
/// ref.watch(loggerProvider) from the [envProvider] itself, it will cause a
/// circular dependency and Riverpod does not allow that.
@riverpod
void envPrintWatcher(Ref ref) {
  final envData = ref.watch(envProvider);
  final logger = ref.watch(loggerProvider);

  debugPrint('Environment variables loaded');
  logger.i(envData.toJson());
}
