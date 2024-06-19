// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productFutureHash() => r'742f96f44341b48e88c22403806b379514abbe8a';

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

/// See also [productFuture].
@ProviderFor(productFuture)
const productFutureProvider = ProductFutureFamily();

/// See also [productFuture].
class ProductFutureFamily extends Family<AsyncValue<Product>> {
  /// See also [productFuture].
  const ProductFutureFamily();

  /// See also [productFuture].
  ProductFutureProvider call(
    int id,
  ) {
    return ProductFutureProvider(
      id,
    );
  }

  @override
  ProductFutureProvider getProviderOverride(
    covariant ProductFutureProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'productFutureProvider';
}

/// See also [productFuture].
class ProductFutureProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [productFuture].
  ProductFutureProvider(
    int id,
  ) : this._internal(
          (ref) => productFuture(
            ref as ProductFutureRef,
            id,
          ),
          from: productFutureProvider,
          name: r'productFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productFutureHash,
          dependencies: ProductFutureFamily._dependencies,
          allTransitiveDependencies:
              ProductFutureFamily._allTransitiveDependencies,
          id: id,
        );

  ProductFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(ProductFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductFutureProvider._internal(
        (ref) => create(ref as ProductFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _ProductFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductFutureRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductFutureProviderElement
    extends AutoDisposeFutureProviderElement<Product> with ProductFutureRef {
  _ProductFutureProviderElement(super.provider);

  @override
  int get id => (origin as ProductFutureProvider).id;
}

String _$productFromListFutureHash() =>
    r'1378982f4d625e9b57f434b59e6d1623138a827f';

/// See also [productFromListFuture].
@ProviderFor(productFromListFuture)
const productFromListFutureProvider = ProductFromListFutureFamily();

/// See also [productFromListFuture].
class ProductFromListFutureFamily extends Family<AsyncValue<Product>> {
  /// See also [productFromListFuture].
  const ProductFromListFutureFamily();

  /// See also [productFromListFuture].
  ProductFromListFutureProvider call(
    int id,
  ) {
    return ProductFromListFutureProvider(
      id,
    );
  }

  @override
  ProductFromListFutureProvider getProviderOverride(
    covariant ProductFromListFutureProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'productFromListFutureProvider';
}

/// See also [productFromListFuture].
class ProductFromListFutureProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [productFromListFuture].
  ProductFromListFutureProvider(
    int id,
  ) : this._internal(
          (ref) => productFromListFuture(
            ref as ProductFromListFutureRef,
            id,
          ),
          from: productFromListFutureProvider,
          name: r'productFromListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productFromListFutureHash,
          dependencies: ProductFromListFutureFamily._dependencies,
          allTransitiveDependencies:
              ProductFromListFutureFamily._allTransitiveDependencies,
          id: id,
        );

  ProductFromListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(ProductFromListFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductFromListFutureProvider._internal(
        (ref) => create(ref as ProductFromListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _ProductFromListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductFromListFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductFromListFutureRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductFromListFutureProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with ProductFromListFutureRef {
  _ProductFromListFutureProviderElement(super.provider);

  @override
  int get id => (origin as ProductFromListFutureProvider).id;
}

String _$productsListFutureHash() =>
    r'74277a40c151f523c0e3bc89ffbb482ab455eac6';

/// See also [productsListFuture].
@ProviderFor(productsListFuture)
const productsListFutureProvider = ProductsListFutureFamily();

/// See also [productsListFuture].
class ProductsListFutureFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [productsListFuture].
  const ProductsListFutureFamily();

  /// See also [productsListFuture].
  ProductsListFutureProvider call(
    int page,
  ) {
    return ProductsListFutureProvider(
      page,
    );
  }

  @override
  ProductsListFutureProvider getProviderOverride(
    covariant ProductsListFutureProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'productsListFutureProvider';
}

/// See also [productsListFuture].
class ProductsListFutureProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [productsListFuture].
  ProductsListFutureProvider(
    int page,
  ) : this._internal(
          (ref) => productsListFuture(
            ref as ProductsListFutureRef,
            page,
          ),
          from: productsListFutureProvider,
          name: r'productsListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsListFutureHash,
          dependencies: ProductsListFutureFamily._dependencies,
          allTransitiveDependencies:
              ProductsListFutureFamily._allTransitiveDependencies,
          page: page,
        );

  ProductsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(ProductsListFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsListFutureProvider._internal(
        (ref) => create(ref as ProductsListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _ProductsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsListFutureProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductsListFutureRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _ProductsListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with ProductsListFutureRef {
  _ProductsListFutureProviderElement(super.provider);

  @override
  int get page => (origin as ProductsListFutureProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
