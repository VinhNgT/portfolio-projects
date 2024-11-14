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

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AddToCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddToCartRouteArgs>(
          orElse: () => const AddToCartRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddToCartSheet(
          key: args.key,
          product: args.product,
          initialCartItem: args.initialCartItem,
          onConfirm: args.onConfirm,
        ),
      );
    },
    AppNavRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppNavScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartScreen(),
      );
    },
    CartTabNavRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CartTabNavScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    HomeTabNavRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeTabNavScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProductDetailsScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddToCartSheet]
class AddToCartRoute extends _i7.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i8.Key? key,
    _i9.Product? product,
    _i10.CartItem? initialCartItem,
    void Function(_i10.CartItem)? onConfirm,
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

  static const _i7.PageInfo<AddToCartRouteArgs> page =
      _i7.PageInfo<AddToCartRouteArgs>(name);
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

  final void Function(_i10.CartItem)? onConfirm;

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

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
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

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
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

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
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

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
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

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
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

  static const _i7.PageInfo<ProductDetailsRouteArgs> page =
      _i7.PageInfo<ProductDetailsRouteArgs>(name);
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
