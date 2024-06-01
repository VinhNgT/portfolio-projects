// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sembast_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sembastHash() => r'62b42b04ca243e5a6af7edfbd3923d4a816f2902';

/// See also [sembast].
@ProviderFor(sembast)
final sembastProvider = FutureProvider<Database>.internal(
  sembast,
  name: r'sembastProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sembastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SembastRef = FutureProviderRef<Database>;
String _$inMemorySembastHash() => r'da475b65e73409325e4347763515155662595f9c';

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

/// See also [inMemorySembast].
@ProviderFor(inMemorySembast)
const inMemorySembastProvider = InMemorySembastFamily();

/// See also [inMemorySembast].
class InMemorySembastFamily extends Family<AsyncValue<Database>> {
  /// See also [inMemorySembast].
  const InMemorySembastFamily();

  /// See also [inMemorySembast].
  InMemorySembastProvider call(
    String dbName,
  ) {
    return InMemorySembastProvider(
      dbName,
    );
  }

  @override
  InMemorySembastProvider getProviderOverride(
    covariant InMemorySembastProvider provider,
  ) {
    return call(
      provider.dbName,
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
  String? get name => r'inMemorySembastProvider';
}

/// See also [inMemorySembast].
class InMemorySembastProvider extends AutoDisposeFutureProvider<Database> {
  /// See also [inMemorySembast].
  InMemorySembastProvider(
    String dbName,
  ) : this._internal(
          (ref) => inMemorySembast(
            ref as InMemorySembastRef,
            dbName,
          ),
          from: inMemorySembastProvider,
          name: r'inMemorySembastProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inMemorySembastHash,
          dependencies: InMemorySembastFamily._dependencies,
          allTransitiveDependencies:
              InMemorySembastFamily._allTransitiveDependencies,
          dbName: dbName,
        );

  InMemorySembastProvider._internal(
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
    FutureOr<Database> Function(InMemorySembastRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InMemorySembastProvider._internal(
        (ref) => create(ref as InMemorySembastRef),
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
  AutoDisposeFutureProviderElement<Database> createElement() {
    return _InMemorySembastProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InMemorySembastProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InMemorySembastRef on AutoDisposeFutureProviderRef<Database> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _InMemorySembastProviderElement
    extends AutoDisposeFutureProviderElement<Database> with InMemorySembastRef {
  _InMemorySembastProviderElement(super.provider);

  @override
  String get dbName => (origin as InMemorySembastProvider).dbName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
