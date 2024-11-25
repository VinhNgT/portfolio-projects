// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:e_commerce/features/app_navigation/presentation/app_nav_screen.dart'
    as _i2;
import 'package:e_commerce/features/app_navigation/presentation/tabs_screen.dart'
    as _i4;
import 'package:e_commerce/features/cart/domain/cart_item.dart' as _i10;
import 'package:e_commerce/features/cart/presentation/add_to_cart_sheet.dart'
    as _i1;
import 'package:e_commerce/features/cart/presentation/cart_screen.dart' as _i3;
import 'package:e_commerce/features/home/presentation/home_screen.dart' as _i5;
import 'package:e_commerce/features/products/domain/product.dart' as _i9;
import 'package:e_commerce/features/products/presentation/product_details_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.AddToCartSheet]
class AddToCartRoute extends _i7.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i8.Key? key,
    _i9.Product? product,
    _i10.CartItem? initialCartItem,
    _i1.AddToCartSheetCallback? onConfirm,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AddToCartRoute.name,
          args: AddToCartRouteArgs(
            key: key,
            product: product,
            initialCartItem: initialCartItem,
            onConfirm: onConfirm,
          ),
          initialChildren: children,
        );

  static const String name = 'AddToCartRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddToCartRouteArgs>(
          orElse: () => const AddToCartRouteArgs());
      return _i1.AddToCartSheet(
        key: args.key,
        product: args.product,
        initialCartItem: args.initialCartItem,
        onConfirm: args.onConfirm,
      );
    },
  );
}

class AddToCartRouteArgs {
  const AddToCartRouteArgs({
    this.key,
    this.product,
    this.initialCartItem,
    this.onConfirm,
  });

  final _i8.Key? key;

  final _i9.Product? product;

  final _i10.CartItem? initialCartItem;

  final _i1.AddToCartSheetCallback? onConfirm;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, product: $product, initialCartItem: $initialCartItem, onConfirm: $onConfirm}';
  }
}

/// generated route for
/// [_i2.AppNavScreen]
class AppNavRoute extends _i7.PageRouteInfo<void> {
  const AppNavRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AppNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppNavScreen();
    },
  );
}

/// generated route for
/// [_i3.CartScreen]
class CartRoute extends _i7.PageRouteInfo<void> {
  const CartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.CartScreen();
    },
  );
}

/// generated route for
/// [_i4.CartTabNavScreen]
class CartTabNavRoute extends _i7.PageRouteInfo<void> {
  const CartTabNavRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CartTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabNavRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartTabNavScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeTabNavScreen]
class HomeTabNavRoute extends _i7.PageRouteInfo<void> {
  const HomeTabNavRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabNavRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeTabNavScreen();
    },
  );
}

/// generated route for
/// [_i6.ProductDetailsScreen]
class ProductDetailsRoute extends _i7.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i8.Key? key,
    required int productId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i6.ProductDetailsScreen(
        key: args.key,
        productId: args.productId,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i8.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}
