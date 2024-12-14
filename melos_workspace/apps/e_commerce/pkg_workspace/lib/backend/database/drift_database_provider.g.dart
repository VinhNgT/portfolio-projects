// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driftInMemoryDatabaseHash() =>
    r'76b6097b2caca4d6b8757796776f0f9a574d3f69';

/// See also [driftInMemoryDatabase].
@ProviderFor(driftInMemoryDatabase)
final driftInMemoryDatabaseProvider = Provider<DriftLocalDatabase>.internal(
  driftInMemoryDatabase,
  name: r'driftInMemoryDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$driftInMemoryDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DriftInMemoryDatabaseRef = ProviderRef<DriftLocalDatabase>;
String _$driftLocalDatabaseHash() =>
    r'c17fb1d76ac4be2e3acf5b5370253374e769a248';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [driftLocalDatabase].
@ProviderFor(driftLocalDatabase)
const driftLocalDatabaseProvider = DriftLocalDatabaseFamily();

/// See also [driftLocalDatabase].
class DriftLocalDatabaseFamily extends Family<DriftLocalDatabase> {
  /// See also [driftLocalDatabase].
  const DriftLocalDatabaseFamily();

  /// See also [driftLocalDatabase].
  DriftLocalDatabaseProvider call({
    required String dbName,
  }) {
    return DriftLocalDatabaseProvider(
      dbName: dbName,
    );
  }

  @override
  DriftLocalDatabaseProvider getProviderOverride(
    covariant DriftLocalDatabaseProvider provider,
  ) {
    return call(
      dbName: provider.dbName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'driftLocalDatabaseProvider';
}

/// See also [driftLocalDatabase].
class DriftLocalDatabaseProvider extends Provider<DriftLocalDatabase> {
  /// See also [driftLocalDatabase].
  DriftLocalDatabaseProvider({
    required String dbName,
  }) : this._internal(
          (ref) => driftLocalDatabase(
            ref as DriftLocalDatabaseRef,
            dbName: dbName,
          ),
          from: driftLocalDatabaseProvider,
          name: r'driftLocalDatabaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$driftLocalDatabaseHash,
          dependencies: DriftLocalDatabaseFamily._dependencies,
          allTransitiveDependencies:
              DriftLocalDatabaseFamily._allTransitiveDependencies,
          dbName: dbName,
        );

  DriftLocalDatabaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbName,
  }) : super.internal();

  final String dbName;

  @override
  Override overrideWith(
    DriftLocalDatabase Function(DriftLocalDatabaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DriftLocalDatabaseProvider._internal(
        (ref) => create(ref as DriftLocalDatabaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbName: dbName,
      ),
    );
  }

  @override
  ProviderElement<DriftLocalDatabase> createElement() {
    return _DriftLocalDatabaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DriftLocalDatabaseProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DriftLocalDatabaseRef on ProviderRef<DriftLocalDatabase> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _DriftLocalDatabaseProviderElement
    extends ProviderElement<DriftLocalDatabase> with DriftLocalDatabaseRef {
  _DriftLocalDatabaseProviderElement(super.provider);

  @override
  String get dbName => (origin as DriftLocalDatabaseProvider).dbName;
}

String _$driftDefaultLocalDatabaseHash() =>
    r'261fab8d207602316b029d7ef02f84f102e4c113';

/// See also [driftDefaultLocalDatabase].
@ProviderFor(driftDefaultLocalDatabase)
final driftDefaultLocalDatabaseProvider = Provider<DriftLocalDatabase>.internal(
  driftDefaultLocalDatabase,
  name: r'driftDefaultLocalDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$driftDefaultLocalDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DriftDefaultLocalDatabaseRef = ProviderRef<DriftLocalDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
