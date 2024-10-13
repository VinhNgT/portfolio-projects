import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Creates a [PagingController] that will be disposed automatically.
///
/// The [PagingController] is used to control the pagination of a list of items
/// for [PagedListView] or [PagedSliverList].
///
/// - [firstPageKey] is the key of the first page to be fetched.
/// - [pageSize] is the number of items to be fetched per page.
/// - [fetchPage] determines how to fetch a page of items with a given page key.
/// - [getNextPageKey] determines how to get the key for the next page.
/// - [invisibleItemsThreshold] is the number of remaining invisible items that
///    should trigger a new fetch.
///
/// Example:
///
/// ```dart
/// final pagingController = usePagingController<int, Product>(
///   firstPageKey: 0,
///   pageSize: 10,
///   fetchPage: (pageKey) async {
///     final List<Products> products = await getProductsList(page: pageKey);
///     return products;
///   },
///   getNextPageKey: (currentPageKey, currentPageItems) => ++currentPageKey,
/// );
/// ```
///
/// See also:
/// - [PagingController]
/// - https://pub.dev/packages/infinite_scroll_pagination
PagingController<T, U> usePagingController<T, U>({
  required T firstPageKey,
  required int pageSize,
  required FutureOr<List<U>> Function(T pageKey) fetchPage,
  required T Function(T currentPageKey, List<U> currentPageItems)
      getNextPageKey,
  int? invisibleItemsThreshold,
}) {
  return use(
    _PagingControllerHook(
      firstPageKey: firstPageKey,
      pageSize: pageSize,
      fetchPage: fetchPage,
      getNextPageKey: getNextPageKey,
      invisibleItemsThreshold: invisibleItemsThreshold,
    ),
  );
}

class _PagingControllerHook<T, U> extends Hook<PagingController<T, U>> {
  const _PagingControllerHook({
    required this.firstPageKey,
    required this.pageSize,
    required this.fetchPage,
    required this.getNextPageKey,
    this.invisibleItemsThreshold,
  });

  final T firstPageKey;
  final int pageSize;
  final FutureOr<List<U>> Function(T pageKey) fetchPage;
  final T Function(T currentPageKey, List<U> currentPageItems) getNextPageKey;
  final int? invisibleItemsThreshold;

  @override
  HookState<PagingController<T, U>, _PagingControllerHook<T, U>>
      createState() => _PagingControllerHookState<T, U>();
}

class _PagingControllerHookState<T, U>
    extends HookState<PagingController<T, U>, _PagingControllerHook<T, U>> {
  late final PagingController<T, U> _pagingController = PagingController(
    firstPageKey: hook.firstPageKey,
    invisibleItemsThreshold: hook.invisibleItemsThreshold,
  );

  @override
  void initHook() {
    super.initHook();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  Future<void> _fetchPage(T pageKey) async {
    try {
      final newItems = await hook.fetchPage(pageKey);
      final isLastPage = newItems.length < hook.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = hook.getNextPageKey(pageKey, newItems);
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  PagingController<T, U> build(BuildContext context) {
    return _pagingController;
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }
}
