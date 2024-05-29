// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:driving_license/backend/ads/ad_unit.dart' as _i13;
import 'package:driving_license/backend/ads/rewarded_ad/rewarded_ad_screen.dart'
    as _i8;
import 'package:driving_license/features/exams/domain/exam.dart' as _i12;
import 'package:driving_license/features/exams/presentation/screens/exam_detail_screen/exam_detail_screen.dart'
    as _i2;
import 'package:driving_license/features/exams/presentation/screens/exam_result_screen.dart'
    as _i3;
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen.dart'
    as _i4;
import 'package:driving_license/features/feedback/presentation/send_feedback_screen.dart'
    as _i9;
import 'package:driving_license/features/home/presentation/home_screen.dart'
    as _i5;
import 'package:driving_license/features/in_app_purchase/presentation/donate_screen.dart'
    as _i1;
import 'package:driving_license/features/licenses/presentation/license_selection_screen.dart'
    as _i6;
import 'package:driving_license/features/questions/presentation/question_screen.dart'
    as _i7;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    DonateRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DonateScreen(),
      );
    },
    ExamDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExamDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ExamDetailScreen(
          key: args.key,
          exam: args.exam,
        ),
      );
    },
    ExamResultRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ExamResultScreen(),
      );
    },
    ExamsListRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ExamsListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    LicenseSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseSelectionRouteArgs>(
          orElse: () => const LicenseSelectionRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LicenseSelectionScreen(
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
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.QuestionScreen(
          key: args.key,
          initialPageIndex: args.initialPageIndex,
          onclose: args.onclose,
        ),
      );
    },
    RewardedAdRoute.name: (routeData) {
      final args = routeData.argsAs<RewardedAdRouteArgs>();
      return _i10.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i8.RewardedAdScreen(
          key: args.key,
          adUnit: args.adUnit,
        ),
      );
    },
    SendFeedbackRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SendFeedbackScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DonateScreen]
class DonateRoute extends _i10.PageRouteInfo<void> {
  const DonateRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DonateRoute.name,
          initialChildren: children,
        );

  static const String name = 'DonateRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExamDetailScreen]
class ExamDetailRoute extends _i10.PageRouteInfo<ExamDetailRouteArgs> {
  ExamDetailRoute({
    _i11.Key? key,
    required _i12.Exam exam,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ExamDetailRoute.name,
          args: ExamDetailRouteArgs(
            key: key,
            exam: exam,
          ),
          initialChildren: children,
        );

  static const String name = 'ExamDetailRoute';

  static const _i10.PageInfo<ExamDetailRouteArgs> page =
      _i10.PageInfo<ExamDetailRouteArgs>(name);
}

class ExamDetailRouteArgs {
  const ExamDetailRouteArgs({
    this.key,
    required this.exam,
  });

  final _i11.Key? key;

  final _i12.Exam exam;

  @override
  String toString() {
    return 'ExamDetailRouteArgs{key: $key, exam: $exam}';
  }
}

/// generated route for
/// [_i3.ExamResultScreen]
class ExamResultRoute extends _i10.PageRouteInfo<void> {
  const ExamResultRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ExamResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamResultRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ExamsListScreen]
class ExamsListRoute extends _i10.PageRouteInfo<void> {
  const ExamsListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ExamsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamsListRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LicenseSelectionScreen]
class LicenseSelectionRoute
    extends _i10.PageRouteInfo<LicenseSelectionRouteArgs> {
  LicenseSelectionRoute({
    _i11.Key? key,
    void Function()? afterLicenseSelected,
    bool navigateToHomeAfterLicenseSelected = true,
    List<_i10.PageRouteInfo>? children,
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

  static const _i10.PageInfo<LicenseSelectionRouteArgs> page =
      _i10.PageInfo<LicenseSelectionRouteArgs>(name);
}

class LicenseSelectionRouteArgs {
  const LicenseSelectionRouteArgs({
    this.key,
    this.afterLicenseSelected,
    this.navigateToHomeAfterLicenseSelected = true,
  });

  final _i11.Key? key;

  final void Function()? afterLicenseSelected;

  final bool navigateToHomeAfterLicenseSelected;

  @override
  String toString() {
    return 'LicenseSelectionRouteArgs{key: $key, afterLicenseSelected: $afterLicenseSelected, navigateToHomeAfterLicenseSelected: $navigateToHomeAfterLicenseSelected}';
  }
}

/// generated route for
/// [_i7.QuestionScreen]
class QuestionRoute extends _i10.PageRouteInfo<QuestionRouteArgs> {
  QuestionRoute({
    _i11.Key? key,
    int initialPageIndex = 0,
    void Function(int)? onclose,
    List<_i10.PageRouteInfo>? children,
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

  static const _i10.PageInfo<QuestionRouteArgs> page =
      _i10.PageInfo<QuestionRouteArgs>(name);
}

class QuestionRouteArgs {
  const QuestionRouteArgs({
    this.key,
    this.initialPageIndex = 0,
    this.onclose,
  });

  final _i11.Key? key;

  final int initialPageIndex;

  final void Function(int)? onclose;

  @override
  String toString() {
    return 'QuestionRouteArgs{key: $key, initialPageIndex: $initialPageIndex, onclose: $onclose}';
  }
}

/// generated route for
/// [_i8.RewardedAdScreen]
class RewardedAdRoute extends _i10.PageRouteInfo<RewardedAdRouteArgs> {
  RewardedAdRoute({
    _i11.Key? key,
    required _i13.AdUnit adUnit,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RewardedAdRoute.name,
          args: RewardedAdRouteArgs(
            key: key,
            adUnit: adUnit,
          ),
          initialChildren: children,
        );

  static const String name = 'RewardedAdRoute';

  static const _i10.PageInfo<RewardedAdRouteArgs> page =
      _i10.PageInfo<RewardedAdRouteArgs>(name);
}

class RewardedAdRouteArgs {
  const RewardedAdRouteArgs({
    this.key,
    required this.adUnit,
  });

  final _i11.Key? key;

  final _i13.AdUnit adUnit;

  @override
  String toString() {
    return 'RewardedAdRouteArgs{key: $key, adUnit: $adUnit}';
  }
}

/// generated route for
/// [_i9.SendFeedbackScreen]
class SendFeedbackRoute extends _i10.PageRouteInfo<void> {
  const SendFeedbackRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SendFeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendFeedbackRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
