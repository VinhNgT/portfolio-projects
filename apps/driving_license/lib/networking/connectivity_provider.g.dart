// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityStatusHash() =>
    r'5a6a487d10befaba1ed6936a003693b7dfe0adda';

/// See also [connectivityStatus].
@ProviderFor(connectivityStatus)
final connectivityStatusProvider =
    StreamProvider<List<ConnectivityResult>>.internal(
  connectivityStatus,
  name: r'connectivityStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityStatusRef = StreamProviderRef<List<ConnectivityResult>>;
String _$hasConnectivityHash() => r'7ddab984b04c9695ee524ac2d5b51eea4c17952c';

/// See also [hasConnectivity].
@ProviderFor(hasConnectivity)
final hasConnectivityProvider = FutureProvider<bool>.internal(
  hasConnectivity,
  name: r'hasConnectivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasConnectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HasConnectivityRef = FutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
