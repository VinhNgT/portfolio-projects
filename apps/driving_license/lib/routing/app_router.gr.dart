// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen.dart'
    as _i1;
import 'package:driving_license/features/home/presentation/home_screen.dart'
    as _i2;
import 'package:driving_license/features/licenses/presentation/license_selection_screen.dart'
    as _i3;
import 'package:driving_license/features/questions/presentation/question_screen.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ExamsListRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExamsListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LicenseSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseSelectionRouteArgs>(
          orElse: () => const LicenseSelectionRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LicenseSelectionScreen(
          key: args.key,
          afterLicenseSelected: args.afterLicenseSelected,
          navigateToHomeAfterLicenseSelected:
              args.navigateToHomeAfterLicenseSelected,
        ),
      );
    },
    QuestionRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionRouteArgs>(
          orElse: () => const QuestionRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.QuestionScreen(
          key: args.key,
          initialPageIndex: args.initialPageIndex,
          onclose: args.onclose,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ExamsListScreen]
class ExamsListRoute extends _i5.PageRouteInfo<void> {
  const ExamsListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ExamsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamsListRoute';

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
/// [_i3.LicenseSelectionScreen]
class LicenseSelectionRoute
    extends _i5.PageRouteInfo<LicenseSelectionRouteArgs> {
  LicenseSelectionRoute({
    _i6.Key? key,
    void Function()? afterLicenseSelected,
    bool navigateToHomeAfterLicenseSelected = true,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LicenseSelectionRoute.name,
          args: LicenseSelectionRouteArgs(
            key: key,
            afterLicenseSelected: afterLicenseSelected,
            navigateToHomeAfterLicenseSelected:
                navigateToHomeAfterLicenseSelected,
          ),
          initialChildren: children,
        );

  static const String name = 'LicenseSelectionRoute';

  static const _i5.PageInfo<LicenseSelectionRouteArgs> page =
      _i5.PageInfo<LicenseSelectionRouteArgs>(name);
}

class LicenseSelectionRouteArgs {
  const LicenseSelectionRouteArgs({
    this.key,
    this.afterLicenseSelected,
    this.navigateToHomeAfterLicenseSelected = true,
  });

  final _i6.Key? key;

  final void Function()? afterLicenseSelected;

  final bool navigateToHomeAfterLicenseSelected;

  @override
  String toString() {
    return 'LicenseSelectionRouteArgs{key: $key, afterLicenseSelected: $afterLicenseSelected, navigateToHomeAfterLicenseSelected: $navigateToHomeAfterLicenseSelected}';
  }
}

/// generated route for
/// [_i4.QuestionScreen]
class QuestionRoute extends _i5.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({
    _i6.Key? key,
    int initialPageIndex = 0,
    void Function(int)? onclose,
    List<_i5.PageRouteInfo>? children,
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

  static const _i5.PageInfo<QuestionRouteArgs> page =
      _i5.PageInfo<QuestionRouteArgs>(name);
}

class QuestionRouteArgs {
  const QuestionRouteArgs({
    this.key,
    this.initialPageIndex = 0,
    this.onclose,
  });

  final _i6.Key? key;

  final int initialPageIndex;

  final void Function(int)? onclose;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key, initialPageIndex: $initialPageIndex, onclose: $onclose}';
  }
}
