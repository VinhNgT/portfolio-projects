// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$envHash() => r'5a6950318d433b32e9476d4bea7e0933e1c3d627';

/// See also [env].
@ProviderFor(env)
final envProvider = Provider<EnvData>.internal(
  env,
  name: r'envProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$envHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnvRef = ProviderRef<EnvData>;
String _$envPrintWatcherHash() => r'008be86fe7187df1ec23d58bee79d39f8676adac';

/// This provider prints the current environment variables to the console.
///
/// We must use a separate provider for this because if we use
/// ref.watch(loggerProvider) from the [envProvider] itself, it will cause a
/// circular dependency and Riverpod does not allow that.
///
/// Copied from [envPrintWatcher].
@ProviderFor(envPrintWatcher)
final envPrintWatcherProvider = Provider<void>.internal(
  envPrintWatcher,
  name: r'envPrintWatcherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$envPrintWatcherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnvPrintWatcherRef = ProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
