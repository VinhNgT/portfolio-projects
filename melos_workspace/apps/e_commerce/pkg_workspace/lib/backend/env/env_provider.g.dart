// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$envHash() => r'08f17969e249405c1682087e6c8868fbcd6e531e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EnvRef = ProviderRef<EnvData>;
String _$envPrintWatcherHash() => r'6e25016a6bf17d580ee11e98c8252671e96ccbd8';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EnvPrintWatcherRef = ProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
