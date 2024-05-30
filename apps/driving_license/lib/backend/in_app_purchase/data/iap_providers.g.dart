// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iap_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$iapHash() => r'2ed47dc1e131ef50c17f109fd7d290a6bb473dd2';

/// See also [iap].
@ProviderFor(iap)
final iapProvider = Provider<InAppPurchase>.internal(
  iap,
  name: r'iapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$iapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IapRef = ProviderRef<InAppPurchase>;
String _$purchaseDetailsListStreamHash() =>
    r'fa0e61fd3898e7ec8dbbeda6548c664ba56669b5';

/// See also [purchaseDetailsListStream].
@ProviderFor(purchaseDetailsListStream)
final purchaseDetailsListStreamProvider =
    StreamProvider<List<PurchaseDetails>>.internal(
  purchaseDetailsListStream,
  name: r'purchaseDetailsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchaseDetailsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PurchaseDetailsListStreamRef = StreamProviderRef<List<PurchaseDetails>>;
String _$isIapAvailableHash() => r'36d535db9949a758bdcf55c4607231848629d016';

/// See also [isIapAvailable].
@ProviderFor(isIapAvailable)
final isIapAvailableProvider = AutoDisposeFutureProvider<bool>.internal(
  isIapAvailable,
  name: r'isIapAvailableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isIapAvailableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsIapAvailableRef = AutoDisposeFutureProviderRef<bool>;
String _$iapProductsListFutureHash() =>
    r'29c3151990df4f0824ebcd54e1a9b43dd440b3d6';

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

/// See also [iapProductsListFuture].
@ProviderFor(iapProductsListFuture)
const iapProductsListFutureProvider = IapProductsListFutureFamily();

/// See also [iapProductsListFuture].
class IapProductsListFutureFamily extends Family<AsyncValue<List<IapProduct>>> {
  /// See also [iapProductsListFuture].
  const IapProductsListFutureFamily();

  /// See also [iapProductsListFuture].
  IapProductsListFutureProvider call(
    List<IapProductEntry> iapProductEntries,
  ) {
    return IapProductsListFutureProvider(
      iapProductEntries,
    );
  }

  @override
  IapProductsListFutureProvider getProviderOverride(
    covariant IapProductsListFutureProvider provider,
  ) {
    return call(
      provider.iapProductEntries,
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
  String? get name => r'iapProductsListFutureProvider';
}

/// See also [iapProductsListFuture].
class IapProductsListFutureProvider
    extends AutoDisposeFutureProvider<List<IapProduct>> {
  /// See also [iapProductsListFuture].
  IapProductsListFutureProvider(
    List<IapProductEntry> iapProductEntries,
  ) : this._internal(
          (ref) => iapProductsListFuture(
            ref as IapProductsListFutureRef,
            iapProductEntries,
          ),
          from: iapProductsListFutureProvider,
          name: r'iapProductsListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$iapProductsListFutureHash,
          dependencies: IapProductsListFutureFamily._dependencies,
          allTransitiveDependencies:
              IapProductsListFutureFamily._allTransitiveDependencies,
          iapProductEntries: iapProductEntries,
        );

  IapProductsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.iapProductEntries,
  }) : super.internal();

  final List<IapProductEntry> iapProductEntries;

  @override
  Override overrideWith(
    FutureOr<List<IapProduct>> Function(IapProductsListFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IapProductsListFutureProvider._internal(
        (ref) => create(ref as IapProductsListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        iapProductEntries: iapProductEntries,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<IapProduct>> createElement() {
    return _IapProductsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IapProductsListFutureProvider &&
        other.iapProductEntries == iapProductEntries;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, iapProductEntries.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IapProductsListFutureRef
    on AutoDisposeFutureProviderRef<List<IapProduct>> {
  /// The parameter `iapProductEntries` of this provider.
  List<IapProductEntry> get iapProductEntries;
}

class _IapProductsListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<IapProduct>>
    with IapProductsListFutureRef {
  _IapProductsListFutureProviderElement(super.provider);

  @override
  List<IapProductEntry> get iapProductEntries =>
      (origin as IapProductsListFutureProvider).iapProductEntries;
}

String _$iapPurchaseStreamHash() => r'0a5a53d387a55a9985c6c4534ecfeb0436b7d106';

/// See also [iapPurchaseStream].
@ProviderFor(iapPurchaseStream)
const iapPurchaseStreamProvider = IapPurchaseStreamFamily();

/// See also [iapPurchaseStream].
class IapPurchaseStreamFamily extends Family<AsyncValue<IapProductPurchase?>> {
  /// See also [iapPurchaseStream].
  const IapPurchaseStreamFamily();

  /// See also [iapPurchaseStream].
  IapPurchaseStreamProvider call(
    IapProduct<IapProductEntry> product,
  ) {
    return IapPurchaseStreamProvider(
      product,
    );
  }

  @override
  IapPurchaseStreamProvider getProviderOverride(
    covariant IapPurchaseStreamProvider provider,
  ) {
    return call(
      provider.product,
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
  String? get name => r'iapPurchaseStreamProvider';
}

/// See also [iapPurchaseStream].
class IapPurchaseStreamProvider
    extends AutoDisposeStreamProvider<IapProductPurchase?> {
  /// See also [iapPurchaseStream].
  IapPurchaseStreamProvider(
    IapProduct<IapProductEntry> product,
  ) : this._internal(
          (ref) => iapPurchaseStream(
            ref as IapPurchaseStreamRef,
            product,
          ),
          from: iapPurchaseStreamProvider,
          name: r'iapPurchaseStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$iapPurchaseStreamHash,
          dependencies: IapPurchaseStreamFamily._dependencies,
          allTransitiveDependencies:
              IapPurchaseStreamFamily._allTransitiveDependencies,
          product: product,
        );

  IapPurchaseStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final IapProduct<IapProductEntry> product;

  @override
  Override overrideWith(
    Stream<IapProductPurchase?> Function(IapPurchaseStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IapPurchaseStreamProvider._internal(
        (ref) => create(ref as IapPurchaseStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<IapProductPurchase?> createElement() {
    return _IapPurchaseStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IapPurchaseStreamProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IapPurchaseStreamRef
    on AutoDisposeStreamProviderRef<IapProductPurchase?> {
  /// The parameter `product` of this provider.
  IapProduct<IapProductEntry> get product;
}

class _IapPurchaseStreamProviderElement
    extends AutoDisposeStreamProviderElement<IapProductPurchase?>
    with IapPurchaseStreamRef {
  _IapPurchaseStreamProviderElement(super.provider);

  @override
  IapProduct<IapProductEntry> get product =>
      (origin as IapPurchaseStreamProvider).product;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
