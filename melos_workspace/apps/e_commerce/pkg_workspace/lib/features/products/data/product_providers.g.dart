// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productFromListFutureHash() =>
    r'0b371a31420e23295c23ac1bc7d012d6f6ef6443';

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

/// A provider that fetches a list of products from the repository, and then
/// returns a product from that list.
///
/// Copied from [productFromListFuture].
@ProviderFor(productFromListFuture)
const productFromListFutureProvider = ProductFromListFutureFamily();

/// A provider that fetches a list of products from the repository, and then
/// returns a product from that list.
///
/// Copied from [productFromListFuture].
class ProductFromListFutureFamily extends Family<AsyncValue<Product>> {
  /// A provider that fetches a list of products from the repository, and then
  /// returns a product from that list.
  ///
  /// Copied from [productFromListFuture].
  const ProductFromListFutureFamily();

  /// A provider that fetches a list of products from the repository, and then
  /// returns a product from that list.
  ///
  /// Copied from [productFromListFuture].
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

/// A provider that fetches a list of products from the repository, and then
/// returns a product from that list.
///
/// Copied from [productFromListFuture].
class ProductFromListFutureProvider extends AutoDisposeFutureProvider<Product> {
  /// A provider that fetches a list of products from the repository, and then
  /// returns a product from that list.
  ///
  /// Copied from [productFromListFuture].
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'baf05d1584138733486f12a6c7948da53abd1d8c';

/// A provider that fetches a list of products from the repository.
///
/// Copied from [productsListFuture].
@ProviderFor(productsListFuture)
const productsListFutureProvider = ProductsListFutureFamily();

/// A provider that fetches a list of products from the repository.
///
/// Copied from [productsListFuture].
class ProductsListFutureFamily extends Family<AsyncValue<List<Product>>> {
  /// A provider that fetches a list of products from the repository.
  ///
  /// Copied from [productsListFuture].
  const ProductsListFutureFamily();

  /// A provider that fetches a list of products from the repository.
  ///
  /// Copied from [productsListFuture].
  ProductsListFutureProvider call(
    int pageId,
  ) {
    return ProductsListFutureProvider(
      pageId,
    );
  }

  @override
  ProductsListFutureProvider getProviderOverride(
    covariant ProductsListFutureProvider provider,
  ) {
    return call(
      provider.pageId,
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

/// A provider that fetches a list of products from the repository.
///
/// Copied from [productsListFuture].
class ProductsListFutureProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// A provider that fetches a list of products from the repository.
  ///
  /// Copied from [productsListFuture].
  ProductsListFutureProvider(
    int pageId,
  ) : this._internal(
          (ref) => productsListFuture(
            ref as ProductsListFutureRef,
            pageId,
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
          pageId: pageId,
        );

  ProductsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageId,
  }) : super.internal();

  final int pageId;

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
        pageId: pageId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _ProductsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsListFutureProvider && other.pageId == pageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsListFutureRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `pageId` of this provider.
  int get pageId;
}

class _ProductsListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with ProductsListFutureRef {
  _ProductsListFutureProviderElement(super.provider);

  @override
  int get pageId => (origin as ProductsListFutureProvider).pageId;
}

String _$productFutureHash() => r'da634f9a7f9e209a4f1e9c65ba569ea95c932fe6';

abstract class _$ProductFuture
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final int id;

  FutureOr<Product> build(
    int id,
  );
}

/// A provider that fetches a product from the repository.
///
/// Copied from [ProductFuture].
@ProviderFor(ProductFuture)
const productFutureProvider = ProductFutureFamily();

/// A provider that fetches a product from the repository.
///
/// Copied from [ProductFuture].
class ProductFutureFamily extends Family<AsyncValue<Product>> {
  /// A provider that fetches a product from the repository.
  ///
  /// Copied from [ProductFuture].
  const ProductFutureFamily();

  /// A provider that fetches a product from the repository.
  ///
  /// Copied from [ProductFuture].
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

/// A provider that fetches a product from the repository.
///
/// Copied from [ProductFuture].
class ProductFutureProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductFuture, Product> {
  /// A provider that fetches a product from the repository.
  ///
  /// Copied from [ProductFuture].
  ProductFutureProvider(
    int id,
  ) : this._internal(
          () => ProductFuture()..id = id,
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
  FutureOr<Product> runNotifierBuild(
    covariant ProductFuture notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ProductFuture Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductFutureProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<ProductFuture, Product>
      createElement() {
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductFutureRef on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductFutureProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductFuture, Product>
    with ProductFutureRef {
  _ProductFutureProviderElement(super.provider);

  @override
  int get id => (origin as ProductFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
