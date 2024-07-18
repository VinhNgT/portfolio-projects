import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routing/app_router_provider.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class AppNavScreen extends HookConsumerWidget {
  const AppNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        HomeTabNavRoute(),
        CartTabNavRoute(),
        HomeRoute(),
        HomeRoute(),
      ],
      builder: (context, child) {
        return _AutoRouteTabsScaffold(
          popTabIndex: 0,
          child: child,
        );
      },
    );
  }
}

class _AutoRouteTabsScaffold extends HookConsumerWidget {
  const _AutoRouteTabsScaffold({
    required this.child,
    this.popTabIndex = 0,
  });

  final Widget child;

  /// Index of the tab that popping will be allowed.
  ///
  /// If the current tab index is not equal to this value and a pop event is
  /// received, then it will be set to this value instead of popping.
  final int popTabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);
    final currentTabIndex = useListenableSelector(
      tabsRouter,
      () => tabsRouter.activeIndex,
    );

    return PopScope(
      canPop: currentTabIndex == popTabIndex,
      onPopInvoked: (_) {
        if (currentTabIndex != popTabIndex) {
          tabsRouter.setActiveIndex(popTabIndex);
        }
      },
      child: Scaffold(
        body: child,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            SafeArea(
              // 'maintainBottomViewPadding' needs to be set to true. This
              // prevents the NavigationBar from moving downwards when the
              // bottom screen padding is 0 (e.g. when the keyboard is opened).
              maintainBottomViewPadding: true,
              child: NavigationBar(
                elevation: 0,
                selectedIndex: currentTabIndex,
                onDestinationSelected: (index) {
                  if (index < 2) {
                    tabsRouter.setActiveIndex(index);
                  }
                },
                destinations: const [
                  NavigationDestination(
                    label: 'Trang chủ',
                    icon: Icon(Symbols.home),
                    selectedIcon: Icon(Symbols.home, fill: 1),
                  ),
                  NavigationDestination(
                    label: 'Giỏ hàng',
                    icon: Icon(Symbols.shopping_cart),
                    selectedIcon: Icon(Symbols.shopping_cart, fill: 1),
                  ),
                  NavigationDestination(
                    label: 'Đơn hàng',
                    icon: Icon(Symbols.assignment),
                    selectedIcon: Icon(Symbols.assignment, fill: 1),
                  ),
                  NavigationDestination(
                    label: 'Cá nhân',
                    icon: Icon(Symbols.person),
                    selectedIcon: Icon(Symbols.person, fill: 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
