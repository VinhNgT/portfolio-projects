import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/constants/app_sizes.dart';
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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kSize_96,
        title: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              focusNode: searchBarFocusNode,
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
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
          viewLeading: IconButton(
            onPressed: () {
              context.maybePop();
            },
            icon: const Icon(Symbols.arrow_back),
          ),
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(3, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {},
              );
            });
          },
        ),
      ),
      body: const Text('Home Screen'),
    );
  }

  void _unfocusSearchBar(FocusNode focusNode) {
    // For some reason sometime the searchbar does not unfocus unless we do it
    // in a post frame callback.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.unfocus();
    });
  }
}
