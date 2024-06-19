import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProductSearchBar extends HookConsumerWidget {
  const ProductSearchBar({
    super.key,
    required this.scrollController,
    this.showShadowOffset = 0.0,
  });

  /// Scroll controller to detect the scroll offset and show/hide the shadow accordingly.
  final ScrollController scrollController;

  /// The offset to hide the shadow of the search bar.
  final double showShadowOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBarFocusNode = useFocusNode();

    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return ListenableBuilder(
          listenable: scrollController,
          builder: (context, _) {
            final shadowColor = scrollController.hasClients &&
                    scrollController.offset > showShadowOffset
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
      suggestionsBuilder: (BuildContext context, SearchController controller) {
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
