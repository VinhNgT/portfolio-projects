import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class ProductDetailScreen extends HookConsumerWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Symbols.search)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.bookmark_add)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.share)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.more_vert)),
        ],
      ),
      body: const CustomScrollView(),
    );
  }
}
