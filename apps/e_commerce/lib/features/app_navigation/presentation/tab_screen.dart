import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeTabNavScreen extends StatelessWidget {
  const HomeTabNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class CartTabNavScreen extends StatelessWidget {
  const CartTabNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
