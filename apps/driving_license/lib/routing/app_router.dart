import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

Route<T> myCustomRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageTransition(
    child: child,
    type: PageTransitionType.rightToLeft,
    settings: page,
    duration: const Duration(milliseconds: 100),
    reverseDuration: const Duration(milliseconds: 100),
  );
}

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: QuestionRoute.page),
      ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
        customRouteBuilder: <T>(context, child, page) {
          return PageTransition(
            child: child,
            settings: page,
            curve: Curves.bounceInOut,
            type: PageTransitionType.size,
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 250),
          );
        },
      );
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter();
}
