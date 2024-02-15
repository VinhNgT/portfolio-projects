import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/routing/router_reevaluate_notifier.dart';
import 'package:driving_license/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final routerGuardReevaluate = ref.watch(routerReevaluateNotifierProvider);

    return MaterialApp.router(
      title: 'Driving License App',
      debugShowCheckedModeBanner: false,
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
      routerConfig: appRouter.config(
        // Initial route
        deepLinkBuilder: (_) => const DeepLink([HomeRoute()]),
        reevaluateListenable: routerGuardReevaluate,
      ),
    );
  }
}
