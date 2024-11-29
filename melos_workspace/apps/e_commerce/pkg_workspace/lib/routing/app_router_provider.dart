import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routing/app_router_provider.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_provider.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Sheet,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref) : super();
  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppNavRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeTabNavRoute.page,
              initial: true,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: ProductDetailsRoute.page),
              ],
            ),
            AutoRoute(
              page: CartTabNavRoute.page,
              children: [
                AutoRoute(page: CartRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: OrderTabNavRoute.page,
              children: [
                AutoRoute(page: OrdersRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: AccountTabNavRoute.page,
              children: [
                AutoRoute(page: AccountRoute.page, initial: true),
              ],
            ),
          ],
        ),
        CustomRoute(
          page: AddToCartRoute.page,
          customRouteBuilder: <T>(context, child, page) {
            return ModalBottomSheetRoute(
              settings: page,
              isScrollControlled: false,
              useSafeArea: true,
              scrollControlDisabledMaxHeightRatio: 3 / 4,
              builder: (_) => child,
            );
          },
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
Raw<AppRouter> appRouter(Ref ref) {
  return AppRouter(ref);
}
