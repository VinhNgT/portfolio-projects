// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:driving_license/features/home_page.dart' as _i1;
import 'package:driving_license/features/home_page_2.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    MyHomeRoute2.name: (routeData) {
      final args = routeData.argsAs<MyHomeRoute2Args>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MyHomePage2(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({
    _i4.Key? key,
    required String title,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MyHomeRoute.name,
          args: MyHomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i3.PageInfo<MyHomeRouteArgs> page =
      _i3.PageInfo<MyHomeRouteArgs>(name);
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({
    this.key,
    required this.title,
  });

  final _i4.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.MyHomePage2]
class MyHomeRoute2 extends _i3.PageRouteInfo<MyHomeRoute2Args> {
  MyHomeRoute2({
    _i4.Key? key,
    required String title,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MyHomeRoute2.name,
          args: MyHomeRoute2Args(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute2';

  static const _i3.PageInfo<MyHomeRoute2Args> page =
      _i3.PageInfo<MyHomeRoute2Args>(name);
}

class MyHomeRoute2Args {
  const MyHomeRoute2Args({
    this.key,
    required this.title,
  });

  final _i4.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRoute2Args{key: $key, title: $title}';
  }
}
