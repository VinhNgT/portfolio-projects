import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class AppNavigationScreen extends HookConsumerWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (index) {},
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
          ],
        );
      },
    );
  }
}
