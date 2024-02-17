// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:driving_license/features/home/presentation/home_screen.dart'
    as _i1;
import 'package:driving_license/features/question/presentation/question_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    QuestionRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.QuestionScreen(
          key: args.key,
          chapterDatabaseKey: args.chapterDatabaseKey,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.QuestionScreen]
class QuestionRoute extends _i3.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({
    _i4.Key? key,
    required int chapterDatabaseKey,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          QuestionRoute.name,
          args: QuestionRouteArgs(
            key: key,
            chapterDatabaseKey: chapterDatabaseKey,
          ),
          initialChildren: children,
        );

  static const String name = 'QuestionRoute';

  static const _i3.PageInfo<QuestionRouteArgs> page =
      _i3.PageInfo<QuestionRouteArgs>(name);
}

class QuestionRouteArgs {
  const QuestionRouteArgs({
    this.key,
    required this.chapterDatabaseKey,
  });

  final _i4.Key? key;

  final int chapterDatabaseKey;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key, chapterDatabaseKey: $chapterDatabaseKey}';
  }
}
