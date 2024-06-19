import 'package:e_commerce/common/hooks/use_paging_controller.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
    final pagingController = usePagingController<int, Product>(
      firstPageKey: 0,
      pageSize: ProductRepository.productPageSizeLimit,
      fetchPage: (pageKey) async {
        final keepAlive = ref.listenManual(
          productsListFutureProvider(pageKey),
          (_, __) {},
        );
        final products = await ref.read(
          productsListFutureProvider(pageKey).future,
        );
        keepAlive.close();
        return products;
      },
      getNextPageKey: (currentPageKey, _) => ++currentPageKey,
    );

    return PagedSliverGrid<int, Product>(
      pagingController: pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: axisSpacing,
        mainAxisSpacing: axisSpacing,
        // childAspectRatio: 0.6,
        mainAxisExtent: axisExtend,
      ),
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, item, index) => ProductCard(product: item),
      ),
    );
  }
}
