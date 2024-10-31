// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseRemoteConfigFutureHash() =>
    r'fc2868682a27181f8a0131db88fe1db53f24a40c';

/// See also [firebaseRemoteConfigFuture].
@ProviderFor(firebaseRemoteConfigFuture)
final firebaseRemoteConfigFutureProvider =
    FutureProvider<FirebaseRemoteConfig>.internal(
  firebaseRemoteConfigFuture,
  name: r'firebaseRemoteConfigFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseRemoteConfigFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseRemoteConfigFutureRef = FutureProviderRef<FirebaseRemoteConfig>;
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
    r'7b0ad7debb459273aa63a2ff4c0916c097ec7186';

/// See also [RemoteConfigDataFuture].
@ProviderFor(RemoteConfigDataFuture)
final remoteConfigDataFutureProvider =
    AsyncNotifierProvider<RemoteConfigDataFuture, AppConfigData>.internal(
  RemoteConfigDataFuture.new,
  name: r'remoteConfigDataFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteConfigDataFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteConfigDataFuture = AsyncNotifier<AppConfigData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
