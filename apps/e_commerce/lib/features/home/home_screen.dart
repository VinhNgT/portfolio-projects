import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/intrinsic_size.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/product_card.dart';
import 'package:e_commerce/features/products/presentation/products_list.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBarFocusNode = useFocusNode();
    final scrollController = useScrollController();

    // +4 because the notch is too close to the search bar.
    final homeScreenAppBarHeight = useRef(context.appBarHeight + 4);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: homeScreenAppBarHeight.value,
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
                        final product = ref.watch(productFutureProvider(index));
                        return Text(
                          product.when(
                            data: (product) => product.title!,
                            loading: () => 'Loading...',
                            error: (error, _) => 'Error: $error',
                          ),
                        );
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
          builder: (context, constraints) => ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: (constraints.maxWidth - kSize_12 * 2 - kSize_8) / 2,
            ),
            child: const ProductCard(product: Product.prototype),
          ),
        ),
        builder: (context, prototypeSize, prototype, child) => CustomScrollView(
          controller: scrollController,
          slivers: [
            // SliverSafeArea(
            //   bottom: false,
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       'Gợi ý hôm nay',
            //       style: context.theme.textTheme.titleLarge,
            //     ),
            //   ),
            // ),
            SliverSafeArea(
              // top: false,
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                  top: kSize_16,
                  left: kSize_12,
                  right: kSize_12,
                ),
                sliver: ProductsList(
                  scrollController: scrollController,
                  axisSpacing: kSize_8,
                  axisExtend: prototypeSize.height,
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
