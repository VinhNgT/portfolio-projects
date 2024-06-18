import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/prototype_size.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/home/components/banners_carousel.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/product_card.dart';
import 'package:e_commerce/features/products/presentation/products_list.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const _searchBarBottomPadding = kSize_12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBarFocusNode = useFocusNode();
    final scrollController = useScrollController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: context.appBarHeight,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSize_16),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return ListenableBuilder(
                  listenable: scrollController,
                  builder: (context, _) {
                    // Show the shadow when user scrolls down by
                    // (_searchBarBottomPadding - 4) px.
                    final shadowColor = scrollController.hasClients &&
                            scrollController.offset >
                                _searchBarBottomPadding - 4
                        ? context.theme.searchBarTheme.shadowColor
                        : const MaterialStatePropertyAll(Colors.transparent);

                    return SearchBar(
                      focusNode: searchBarFocusNode,
                      controller: controller,
                      shadowColor: shadowColor,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: kSize_16),
                      ),
                      onTap: () {
                        _unfocusSearchBar(searchBarFocusNode);
                        controller.openView();
                      },
                      onChanged: (_) {
                        _unfocusSearchBar(searchBarFocusNode);
                        controller.openView();
                      },
                      leading: const Icon(Symbols.search),
                      trailing: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Symbols.notifications),
                        ),
                      ],
                    );
                  },
                );
              },
              viewLeading: IconButton(
                onPressed: () {
                  context.maybePop();
                },
                icon: const Icon(Symbols.arrow_back),
              ),
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(3, (int index) {
                  return ListTile(
                    title: Consumer(
                      builder: (context, ref, child) {
                        return Text(Product.prototype.title!);
                      },
                    ),
                    onTap: () {},
                  );
                });
              },
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: const [
          SliverSafeArea(
            bottom: false,
            sliver: SliverGap(_searchBarBottomPadding),
          ),
          _BannersSliver(),
          SliverGap(kSize_32),
          _FlashSaleSliver(),
          SliverGap(kSize_32),
          _ProductListSliver(),
          SliverSafeArea(
            top: false,
            sliver: SliverGap(kSize_24),
          ),
        ],
      ),
    );
  }

  void _unfocusSearchBar(FocusNode focusNode) {
    // For some reason sometimes the searchbar does not unfocus unless we do it
    // in a post frame callback.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.unfocus();
    });
  }
}

class _BannersSliver extends StatelessWidget {
  const _BannersSliver();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const BannersCarousel(),
          const Gap(kSize_12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSize_12),
            child: Image.asset(
              'assets/shopee_banners/banner_buttons.png',
            ),
          ),
        ],
      ),
    );
  }
}

class _FlashSaleSliver extends HookConsumerWidget {
  const _FlashSaleSliver();

  static const _separatorWidth = 8.0;
  static const _itemCount = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productsListFutureProvider(0));

    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kSize_16, right: kSize_0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/flash_sale.png',
                      height: kSize_16,
                    ),
                    Text(
                      'Kết thúc sau 02:07:40',
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Symbols.arrow_forward_ios),
                    label: Text(
                      'Xem tất cả',
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(kSize_8),
          PrototypeSize(
            prototype: ConstrainedBox(
              // Set product card width to 150
              constraints: const BoxConstraints.tightFor(width: 150),
              child: const ProductCard(
                product: Product.prototype,
                isCompact: true,
              ),
            ),
            builder: (context, prototypeSize, _, __) => AsyncValueWidget(
              asyncValue: productList,
              showLoadingIndicator: true,
              builder: (productListValue) => SizedBox(
                height: prototypeSize.height,
                child: ListView.custom(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.symmetric(horizontal: kSize_12),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final int itemIndex = index ~/ 2;

                      return index.isEven
                          ? ProductCard(
                              product: productListValue[itemIndex],
                              isCompact: true,
                            )
                          : const Gap(_separatorWidth);
                    },
                    // _itemCount items, _itemCount - 1 gaps in between
                    childCount: _itemCount * 2 - 1,
                  ),
                  itemExtentBuilder: (index, dimensions) {
                    return index.isEven ? prototypeSize.width : _separatorWidth;
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductListSliver extends StatelessWidget {
  const _ProductListSliver();

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
            child: const ProductCard(product: Product.prototype),
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
