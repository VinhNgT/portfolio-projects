// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteConfigUpdateStreamHash() =>
    r'8a3fcdd2d183c64eefbf2c62a565981c2f7dffbf';

/// See also [_remoteConfigUpdateStream].
@ProviderFor(_remoteConfigUpdateStream)
final _remoteConfigUpdateStreamProvider =
    StreamProvider<RemoteConfigUpdate>.internal(
  _remoteConfigUpdateStream,
  name: r'_remoteConfigUpdateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteConfigUpdateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RemoteConfigUpdateStreamRef = StreamProviderRef<RemoteConfigUpdate>;
String _$remoteConfigDataFutureHash() =>
    r'c49925eec69afdbef085859a01a87d6af098a725';

/// See also [RemoteConfigDataFuture].
@ProviderFor(RemoteConfigDataFuture)
final remoteConfigDataFutureProvider =
    AsyncNotifierProvider<RemoteConfigDataFuture, RemoteConfigData>.internal(
  RemoteConfigDataFuture.new,
  name: r'remoteConfigDataFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteConfigDataFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteConfigDataFuture = AsyncNotifier<RemoteConfigData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
