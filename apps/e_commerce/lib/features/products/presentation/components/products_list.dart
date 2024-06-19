import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/hooks/use_paging_controller.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
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
        final keepAlive = ref.listenManual(
          productsListFutureProvider(pageKey),
          (_, __) {},
        );
        final products = await ref.read(
          productsListFutureProvider(pageKey).future,
        );

        // The result should be fetched and saved in the Dio cache by now, so
        // can safely dispose the provider.
        keepAlive.close();
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
        itemBuilder: (context, ProductId _, index) => Consumer(
          builder: (context, ref, child) {
            final product = ref.watch(productFromListFutureProvider(index));
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
