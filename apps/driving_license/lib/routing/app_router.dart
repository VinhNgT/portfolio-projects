import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page),
        AutoRoute(page: MyHomeRoute2.page),
      ];
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter();
}
