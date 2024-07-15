// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:e_commerce/features/app_navigation/presentation/app_navigation_screen.dart'
    as _i1;
import 'package:e_commerce/features/app_navigation/presentation/home_tab_navigation_screen.dart'
    as _i3;
import 'package:e_commerce/features/home/presentation/home_screen.dart' as _i2;
import 'package:e_commerce/features/products/presentation/product_details_screen.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppNavigationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    HomeTabNavigationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeTabNavigationScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailsScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppNavigationScreen]
class AppNavigationRoute extends _i5.PageRouteInfo<void> {
  const AppNavigationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AppNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavigationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeTabNavigationScreen]
class HomeTabNavigationRoute extends _i5.PageRouteInfo<void> {
  const HomeTabNavigationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeTabNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabNavigationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductDetailsScreen]
class ProductDetailsRoute extends _i5.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i6.Key? key,
    required int productId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i5.PageInfo<ProductDetailsRouteArgs> page =
      _i5.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i6.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}
