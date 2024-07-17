// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:e_commerce/features/app_navigation/presentation/app_nav_screen.dart'
    as _i1;
import 'package:e_commerce/features/app_navigation/presentation/tab_screen.dart'
    as _i3;
import 'package:e_commerce/features/cart/presentation/cart_screen.dart' as _i2;
import 'package:e_commerce/features/home/presentation/home_screen.dart' as _i4;
import 'package:e_commerce/features/products/presentation/product_details_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AppNavRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppNavScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartScreen(),
      );
    },
    CartTabNavRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartTabNavScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    HomeTabNavRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeTabNavScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProductDetailsScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppNavScreen]
class AppNavRoute extends _i6.PageRouteInfo<void> {
  const AppNavRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AppNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i6.PageRouteInfo<void> {
  const CartRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartTabNavScreen]
class CartTabNavRoute extends _i6.PageRouteInfo<void> {
  const CartTabNavRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CartTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabNavRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeTabNavScreen]
class HomeTabNavRoute extends _i6.PageRouteInfo<void> {
  const HomeTabNavRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeTabNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabNavRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductDetailsScreen]
class ProductDetailsRoute extends _i6.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i7.Key? key,
    required int productId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i6.PageInfo<ProductDetailsRouteArgs> page =
      _i6.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i7.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}
