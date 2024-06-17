import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/intrinsic_size.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/home/components/banners_carousel.dart';
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

  // We use these 2 constants below to calculate the width and height of the
  // product card for accurate grid layouts.
  static const _productGridLeftRightPading = kSize_12;
  static const _productCardAxisSpacing = kSize_8;

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
            padding: const EdgeInsets.symmetric(horizontal: kSize_12),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return ListenableBuilder(
                  listenable: scrollController,
                  builder: (context, _) {
                    // Hide the shadow when user scrolls down 4px.
                    final shadowColor = scrollController.hasClients &&
                            scrollController.offset > 4
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
      body: IntrinsicSize(
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
        builder: (context, prototypeSize, _, child) => CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverSafeArea(
              bottom: false,
              sliver: SliverGap(kSize_12),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                  top: kSize_32,
                  left: _productGridLeftRightPading,
                  right: _productGridLeftRightPading,
                ),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        'Gợi ý hôm nay',
                        style: context.theme.textTheme.titleLarge,
                      ),
                    ),
                    const SliverGap(kSize_16),
                    ProductsList(
                      scrollController: scrollController,
                      axisSpacing: _productCardAxisSpacing,
                      axisExtend: prototypeSize.height,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
