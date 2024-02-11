import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/router.dart';
import 'package:driving_license/routing/router.gr.dart';
import 'package:driving_license/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Driving License App',
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
      routerConfig: _appRouter.config(
        // Initial route
        deepLinkBuilder: (_) => DeepLink([MyHomeRoute(title: 'test')]),
      ),
    );
  }
}
