import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/hooks/use_run_first_build.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class ProductDetailsScreen extends HookConsumerWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productFutureProvider(productId));
    useInitState(() {
      Future(
        () => ref.read(productFutureProvider(productId).notifier).refresh(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Symbols.search)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.bookmark_add)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.share)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.more_vert)),
        ],
      ),
      body: AsyncValueWidget(
        asyncValue: product,
        showPreviousDataWhileLoading: true,
        builder: (dataValue) {
          return Text(dataValue.title!);
        },
      ),
    );
  }
}
