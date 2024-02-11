import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page),
        AutoRoute(page: MyHomeRoute2.page),
      ];
}
