import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/hooks/use_run_first_build.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/benefits_card.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/product_images_carousel.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class ProductDetailsScreen extends HookConsumerWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productFutureProvider(productId));
    useInitState(() {
      Future(
        () => ref.read(productFutureProvider(productId).notifier).refresh(),
      );
    });

    // final realm = ref.watch(realmProvider).requireValue;

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
        asyncValue: productAsync,
        showPreviousDataWhileLoading: true,
        builder: (product) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProductImagesCarousel(product: product),
              ),
              const SliverGap(kSize_12),
              SliverToBoxAdapter(
                child: ProductInfoWidget(product: product),
              ),
              const SliverGap(kSize_20),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kSize_16),
                  child: BenefitsCard(),
                ),
              ),
              const SliverGap(kSize_20),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSize_16),
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Symbols.add_shopping_cart),
                    label: const Text('Thêm vào giỏ hàng'),
                  ),
                ),
              ),
              const SliverGap(kSize_20),
            ],
          );
        },
      ),
    );
  }
}
