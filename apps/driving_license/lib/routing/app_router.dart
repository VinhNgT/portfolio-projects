import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:driving_license/features/home/presentation/home_screen.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/routing/previous_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  final AppRouterRef ref;
  AppRouter(this.ref) : super();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: LicenseSelectionRoute.page,
          transitionsBuilder: _licenseSelectionFromToTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          guards: [HomeRouteGuard(ref)],
          transitionsBuilder: _licenseSelectionFromToTransition,
          initial: true,
        ),
        AutoRoute(page: QuestionRoute.page),
        AutoRoute(page: ExamsListRoute.page),
      ];

  @override
  RouteType get defaultRouteType =>
      RouteType.custom(transitionsBuilder: _defaultTransition);
}

extension _TransitionX on AppRouter {
  RouteTransitionsBuilder get _defaultTransition => (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          SharedAxisTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );

  RouteTransitionsBuilder get _licenseSelectionFromToTransition => (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        final previousRouteName = ref.read(previousRouteObserverProvider).name;
        final currentRouteName = context.topRoute.name;

        if (previousRouteName == LicenseSelectionRoute.name ||
            currentRouteName == LicenseSelectionRoute.name) {
          return FadeThroughTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        }

        return _defaultTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      };
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter(ref);
}
