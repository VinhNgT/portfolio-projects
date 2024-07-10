import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/hooks/use_run_first_build.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/product_images_carousel.dart';
import 'package:flutter/material.dart';
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
                child: Column(
                  children: [
                    ProductImagesCarousel(product: product),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     final realmProduct = Product.prototype
                    //         .copyWith(
                    //           meta: Product.prototype.meta!.copyWith(
                    //               createdAt: DateTime.now().toLocal()),
                    //         )
                    //         .toRealm();
                    //     realm.write(() {
                    //       realm.add(realmProduct, update: true);
                    //     });

                    //     final readTest =
                    //         realm.find<ProductRealm>(realmProduct.id);

                    //     print(readTest);
                    //   },
                    //   child: const Text('hello'),
                    // ),

                    // CachedNetworkImage(imageUrl: dataValue.images),
                    // Text(dataValue.data!.name),
                    // Text(dataValue.data!.description),
                    // Text(dataValue.data!.price.toString()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
