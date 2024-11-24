import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/hooks/use_paging_controller.dart';
import 'package:e_commerce/common/prototype_size.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/product_card.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

typedef ProductId = int;

class ProductsList extends HookConsumerWidget {
  const ProductsList({
    super.key,
    required this.axisSpacing,
    required this.axisExtend,
  });

  final double axisSpacing;
  final double axisExtend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = usePagingController<int, ProductId>(
      firstPageKey: 0,
      pageSize: ProductRepository.productPageSizeLimit,
      fetchPage: (pageKey) async {
        ref.listenManual(
          productsListFutureProvider(pageKey),
          (_, __) {},
        );
        final products = await ref.read(
          productsListFutureProvider(pageKey).future,
        );

        return products.map((e) => e.id!).toList();
      },
      getNextPageKey: (currentPageKey, _) => ++currentPageKey,
    );

    return PagedSliverGrid<int, ProductId>(
      pagingController: pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: axisSpacing,
        mainAxisSpacing: axisSpacing,
        // childAspectRatio: 0.6,
        mainAxisExtent: axisExtend,
      ),
      builderDelegate: PagedChildBuilderDelegate<ProductId>(
        itemBuilder: (context, ProductId id, _) => Consumer(
          builder: (context, ref, child) {
            final product = ref.watch(productFromListFutureProvider(id));
            return AsyncValueWidget(
              asyncValue: product,
              builder: (productValue) => ProductCard(product: productValue),
            );
          },
        ),
      ),
    );
  }
}

class ProductListSliver extends StatelessWidget {
  const ProductListSliver({super.key});

  // We use these 2 constants below to calculate the width and height of the
  // product card for accurate grid layouts.
  static const _productGridLeftRightPading = kSize_12;
  static const _productCardAxisSpacing = kSize_8;

  @override
  Widget build(BuildContext context) {
    return PrototypeSizeSliver(
      prototype: LayoutBuilder(
        builder: (context, constraints) {
          final rowWidthWithoutSpacing = constraints.maxWidth -
              _productGridLeftRightPading * 2 -
              _productCardAxisSpacing;

          final productCardWidth = rowWidthWithoutSpacing / 2;

          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: productCardWidth),
            child: ProductCard(product: Product.prototype),
          );
        },
      ),
      builder: (context, prototypeSize, _, __) => SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSize_16),
              child: Text(
                'Gợi ý hôm nay',
                style: context.theme.textTheme.titleLarge,
              ),
            ),
          ),
          const SliverGap(kSize_16),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: _productGridLeftRightPading,
              right: _productGridLeftRightPading,
            ),
            sliver: ProductsList(
              axisSpacing: _productCardAxisSpacing,
              axisExtend: prototypeSize.height,
            ),
          ),
        ],
      ),
    );
  }
}
