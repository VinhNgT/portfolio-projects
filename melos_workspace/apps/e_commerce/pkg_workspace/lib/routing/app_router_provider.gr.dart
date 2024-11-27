// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:e_commerce/features/account/presentation/account_screen.dart'
    as _i1;
import 'package:e_commerce/features/app_navigation/presentation/app_nav_screen.dart'
    as _i4;
import 'package:e_commerce/features/app_navigation/presentation/tabs_screen.dart'
    as _i2;
import 'package:e_commerce/features/cart/domain/cart_item.dart' as _i12;
import 'package:e_commerce/features/cart/presentation/add_to_cart_sheet.dart'
    as _i3;
import 'package:e_commerce/features/cart/presentation/cart_screen.dart' as _i5;
import 'package:e_commerce/features/home/presentation/home_screen.dart' as _i6;
import 'package:e_commerce/features/orders/presentation/orders_screen.dart'
    as _i7;
import 'package:e_commerce/features/products/domain/product.dart' as _i11;
import 'package:e_commerce/features/products/presentation/product_details_screen.dart'
    as _i8;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountScreen();
    },
  );
}

/// generated route for
/// [_i2.AccountTabNavScreen]
class AccountTabNavRoute extends _i9.PageRouteInfo<void> {
  const AccountTabNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AccountTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountTabNavRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountTabNavScreen();
    },
  );
}

/// generated route for
/// [_i3.AddToCartSheet]
class AddToCartRoute extends _i9.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i10.Key? key,
    _i11.Product? product,
    _i12.CartItem? initialCartItem,
    _i3.AddToCartSheetCallback? onConfirm,
    List<_i9.PageRouteInfo>? children,
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

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddToCartRouteArgs>(
          orElse: () => const AddToCartRouteArgs());
      return _i3.AddToCartSheet(
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

  final _i10.Key? key;

  final _i11.Product? product;

  final _i12.CartItem? initialCartItem;

  final _i3.AddToCartSheetCallback? onConfirm;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, product: $product, initialCartItem: $initialCartItem, onConfirm: $onConfirm}';
  }
}

/// generated route for
/// [_i4.AppNavScreen]
class AppNavRoute extends _i9.PageRouteInfo<void> {
  const AppNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AppNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.AppNavScreen();
    },
  );
}

/// generated route for
/// [_i5.CartScreen]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.CartScreen();
    },
  );
}

/// generated route for
/// [_i2.CartTabNavScreen]
class CartTabNavRoute extends _i9.PageRouteInfo<void> {
  const CartTabNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabNavRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CartTabNavScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeTabNavScreen]
class HomeTabNavRoute extends _i9.PageRouteInfo<void> {
  const HomeTabNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabNavRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeTabNavScreen();
    },
  );
}

/// generated route for
/// [_i2.OrderTabNavScreen]
class OrderTabNavRoute extends _i9.PageRouteInfo<void> {
  const OrderTabNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OrderTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderTabNavRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.OrderTabNavScreen();
    },
  );
}

/// generated route for
/// [_i7.OrdersScreen]
class OrdersRoute extends _i9.PageRouteInfo<void> {
  const OrdersRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i8.ProductDetailsScreen]
class ProductDetailsRoute extends _i9.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i10.Key? key,
    required int productId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i8.ProductDetailsScreen(
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

  final _i10.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}
