import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:driving_license/features/home/presentation/home_screen.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  final AppRouterRef ref;
  AppRouter(this.ref) : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, guards: [HomeRouteGuard(ref)]),
        AutoRoute(page: QuestionRoute.page),
        AutoRoute(page: LicenseSelectionRoute.page),
      ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
      );
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter(ref);
}
