import 'package:e_commerce/routing/app_router_provider.dart';
import 'package:e_commerce/theme/custom_app_theme.dart';
import 'package:e_commerce/theme/flex_color_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
      theme: AppTheme.light,
      builder: (context, child) {
        return AnimatedTheme(
          /// We use CustomAppTheme in this builder instead of calling
          /// CustomAppTheme(FlexColorTheme.light).create() directly in
          /// MaterialApp.router is because [ThemeData.textTheme] sizes are only
          /// available after the app is loaded (when this builder is called).
          ///
          /// We need it to be available so that CustomAppTheme can create a new
          /// textTheme based on the existing one.
          data: CustomAppTheme(context).create(),
          child: AnnotatedRegion(
            value: FlexColorScheme.themedSystemNavigationBar(
              context,
              systemNavBarStyle: FlexSystemNavBarStyle.transparent,
            ),
            child: child!,
          ),
        );
      },
      routerConfig: appRouter.config(),
    );
  }
}
