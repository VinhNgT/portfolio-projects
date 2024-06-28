import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  AppRouter(this.ref) : super();
  final AppRouterRef ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeTabNavigationRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(page: ProductDetailsRoute.page),
              ],
            ),
          ],
        ),
      ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: _getTransition,
      );
}

extension _TransitionX on AppRouter {
  RouteTransitionsBuilder get _getTransition => (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return SharedAxisTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      };
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter(ref);
}
