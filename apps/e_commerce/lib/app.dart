import 'package:e_commerce/router/app_router.dart';
import 'package:e_commerce/theme/flex_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Shopey',
      debugShowCheckedModeBanner: false,
      theme: FlexColorTheme.light,
      routerConfig: appRouter.config(),
    );
  }
}
