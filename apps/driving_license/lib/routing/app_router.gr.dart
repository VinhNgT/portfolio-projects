// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:driving_license/features/exams/domain/exam.dart' as _i9;
import 'package:driving_license/features/exams/presentation/screens/exam_detail_screen/exam_detail_screen.dart'
    as _i1;
import 'package:driving_license/features/exams/presentation/screens/exam_result_screen.dart'
    as _i2;
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen.dart'
    as _i3;
import 'package:driving_license/features/home/presentation/home_screen.dart'
    as _i4;
import 'package:driving_license/features/licenses/presentation/license_selection_screen.dart'
    as _i5;
import 'package:driving_license/features/questions/presentation/question_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ExamDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExamDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ExamDetailScreen(
          key: args.key,
          exam: args.exam,
        ),
      );
    },
    ExamResultRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExamResultScreen(),
      );
    },
    ExamsListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ExamsListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LicenseSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseSelectionRouteArgs>(
          orElse: () => const LicenseSelectionRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LicenseSelectionScreen(
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
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.QuestionScreen(
          key: args.key,
          initialPageIndex: args.initialPageIndex,
          onclose: args.onclose,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ExamDetailScreen]
class ExamDetailRoute extends _i7.PageRouteInfo<ExamDetailRouteArgs> {
  ExamDetailRoute({
    _i8.Key? key,
    required _i9.Exam exam,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ExamDetailRoute.name,
          args: ExamDetailRouteArgs(
            key: key,
            exam: exam,
          ),
          initialChildren: children,
        );

  static const String name = 'ExamDetailRoute';

  static const _i7.PageInfo<ExamDetailRouteArgs> page =
      _i7.PageInfo<ExamDetailRouteArgs>(name);
}

class ExamDetailRouteArgs {
  const ExamDetailRouteArgs({
    this.key,
    required this.exam,
  });

  final _i8.Key? key;

  final _i9.Exam exam;

  @override
  String toString() {
    return 'ExamDetailRouteArgs{key: $key, exam: $exam}';
  }
}

/// generated route for
/// [_i2.ExamResultScreen]
class ExamResultRoute extends _i7.PageRouteInfo<void> {
  const ExamResultRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ExamResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamResultRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ExamsListScreen]
class ExamsListRoute extends _i7.PageRouteInfo<void> {
  const ExamsListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ExamsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamsListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
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
/// [_i5.LicenseSelectionScreen]
class LicenseSelectionRoute
    extends _i7.PageRouteInfo<LicenseSelectionRouteArgs> {
  LicenseSelectionRoute({
    _i8.Key? key,
    void Function()? afterLicenseSelected,
    bool navigateToHomeAfterLicenseSelected = true,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<LicenseSelectionRouteArgs> page =
      _i7.PageInfo<LicenseSelectionRouteArgs>(name);
}

class LicenseSelectionRouteArgs {
  const LicenseSelectionRouteArgs({
    this.key,
    this.afterLicenseSelected,
    this.navigateToHomeAfterLicenseSelected = true,
  });

  final _i8.Key? key;

  final void Function()? afterLicenseSelected;

  final bool navigateToHomeAfterLicenseSelected;

  @override
  String toString() {
    return 'LicenseSelectionRouteArgs{key: $key, afterLicenseSelected: $afterLicenseSelected, navigateToHomeAfterLicenseSelected: $navigateToHomeAfterLicenseSelected}';
  }
}

/// generated route for
/// [_i6.QuestionScreen]
class QuestionRoute extends _i7.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({
    _i8.Key? key,
    int initialPageIndex = 0,
    void Function(int)? onclose,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<QuestionRouteArgs> page =
      _i7.PageInfo<QuestionRouteArgs>(name);
}

class QuestionRouteArgs {
  const QuestionRouteArgs({
    this.key,
    this.initialPageIndex = 0,
    this.onclose,
  });

  final _i8.Key? key;

  final int initialPageIndex;

  final void Function(int)? onclose;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key, initialPageIndex: $initialPageIndex, onclose: $onclose}';
  }
}
