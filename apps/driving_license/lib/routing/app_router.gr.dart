// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:driving_license/features/home/presentation/home_screen.dart'
    as _i1;
import 'package:driving_license/features/licenses/presentation/license_selection_screen.dart'
    as _i2;
import 'package:driving_license/features/questions/presentation/question_screen.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LicenseSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseSelectionRouteArgs>(
          orElse: () => const LicenseSelectionRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LicenseSelectionScreen(
          key: args.key,
          afterLicenseSelected: args.afterLicenseSelected,
        ),
      );
    },
    QuestionRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionRouteArgs>(
          orElse: () => const QuestionRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.QuestionScreen(
          key: args.key,
          initialPageIndex: args.initialPageIndex,
          onclose: args.onclose,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LicenseSelectionScreen]
class LicenseSelectionRoute
    extends _i4.PageRouteInfo<LicenseSelectionRouteArgs> {
  LicenseSelectionRoute({
    _i5.Key? key,
    void Function()? afterLicenseSelected,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LicenseSelectionRoute.name,
          args: LicenseSelectionRouteArgs(
            key: key,
            afterLicenseSelected: afterLicenseSelected,
          ),
          initialChildren: children,
        );

  static const String name = 'LicenseSelectionRoute';

  static const _i4.PageInfo<LicenseSelectionRouteArgs> page =
      _i4.PageInfo<LicenseSelectionRouteArgs>(name);
}

class LicenseSelectionRouteArgs {
  const LicenseSelectionRouteArgs({
    this.key,
    this.afterLicenseSelected,
  });

  final _i5.Key? key;

  final void Function()? afterLicenseSelected;

  @override
  String toString() {
    return 'LicenseSelectionRouteArgs{key: $key, afterLicenseSelected: $afterLicenseSelected}';
  }
}

/// generated route for
/// [_i3.QuestionScreen]
class QuestionRoute extends _i4.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({
    _i5.Key? key,
    int initialPageIndex = 0,
    void Function(int)? onclose,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          QuestionRoute.name,
          args: QuestionRouteArgs(
            key: key,
            initialPageIndex: initialPageIndex,
            onclose: onclose,
          ),
          initialChildren: children,
        );

  static const String name = 'QuestionRoute';

  static const _i4.PageInfo<QuestionRouteArgs> page =
      _i4.PageInfo<QuestionRouteArgs>(name);
}

class QuestionRouteArgs {
  const QuestionRouteArgs({
    this.key,
    this.initialPageIndex = 0,
    this.onclose,
  });

  final _i5.Key? key;

  final int initialPageIndex;

  final void Function(int)? onclose;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key, initialPageIndex: $initialPageIndex, onclose: $onclose}';
  }
}
