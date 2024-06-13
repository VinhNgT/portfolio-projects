import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/routing/app_router.dart';
import 'package:e_commerce/theme/flex_color_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    final flexTheme = FlexColorTheme.light;
    final theme = flexTheme.copyWith(
      iconTheme: flexTheme.iconTheme.copyWith(
        opticalSize: kSize_24,
      ),
      appBarTheme: flexTheme.appBarTheme.copyWith(
        toolbarHeight: kSize_64,
      ),
      cardTheme: flexTheme.cardTheme.copyWith(
        margin: EdgeInsets.zero,
      ),
    );

    return MaterialApp.router(
      title: 'Shopey',
      debugShowCheckedModeBanner: false,
      theme: theme,
      builder: (context, child) {
        return AnnotatedRegion(
          value: FlexColorScheme.themedSystemNavigationBar(
            context,
            systemNavBarStyle: FlexSystemNavBarStyle.transparent,
            useDivider: false,
          ),
          child: child!,
        );
      },
      routerConfig: appRouter.config(),
    );
  }
}
