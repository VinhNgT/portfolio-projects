// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartItemsListHash() => r'e62d65ed3aa43bb673f6173a7748c1304a14298f';

/// See also [cartItemsList].
@ProviderFor(cartItemsList)
final cartItemsListProvider =
    AutoDisposeStreamProvider<List<OrderItem>>.internal(
  cartItemsList,
  name: r'cartItemsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartItemsListRef = AutoDisposeStreamProviderRef<List<OrderItem>>;
String _$cartOrderHash() => r'66b926f2036d51d0be9ba4417d7ace72a5a91d01';

/// See also [cartOrder].
@ProviderFor(cartOrder)
final cartOrderProvider = AutoDisposeStreamProvider<Order>.internal(
  cartOrder,
  name: r'cartOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartOrderRef = AutoDisposeStreamProviderRef<Order>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
