import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);

    return MaterialApp.router(
      title: 'Driving License App',
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
      routerConfig: appRouter.config(
        // Initial route
        deepLinkBuilder: (_) => DeepLink([MyHomeRoute(title: 'test')]),
      ),
    );
  }
}
