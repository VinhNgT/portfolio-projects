import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.dart';
import 'package:driving_license/routing/router_reevaluate_notifier.dart';
import 'package:driving_license/theme/theme.dart';
import 'package:driving_license/utils/app_ui_overlay.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    unawaited(setSystemChrome(context));
    final appRouter = ref.watch(appRouterProvider);
    final routerGuardReevaluate = ref.watch(routerReevaluateNotifierProvider);

    return MaterialApp.router(
      title: 'Driving License App',
      debugShowCheckedModeBanner: false,
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
      routerConfig: appRouter.config(
        // Initial route with parameter
        // deepLinkBuilder: (_) => const DeepLink([HomeRoute()]),
        reevaluateListenable: routerGuardReevaluate,
        // AwareRouteState widget needs this to function
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}

Future<void> setSystemChrome(BuildContext context) async {
  // Lock device orientation
  unawaited(
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  );

  unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
  SystemChrome.setSystemUIOverlayStyle(
    AppUiOverlay(context.brightness).navigationBarOverlayStyle,
  );
}
