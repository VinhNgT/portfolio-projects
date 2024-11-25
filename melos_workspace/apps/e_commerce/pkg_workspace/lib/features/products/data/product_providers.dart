import 'package:dio/dio.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

/// A provider that fetches a product from the repository.
@riverpod
class ProductFuture extends _$ProductFuture {
  Future<Product> _getProduct() {
    final productRepository = ref.watch(productRepositoryProvider);
    final CancelToken cancelToken = CancelToken();
    ref.onDispose(cancelToken.cancel);

    return productRepository.getProduct(
      id: id,
      cancelToken: cancelToken,
    );
  }

  @override
  FutureOr<Product> build(int id) async {
    final pageId = ProductRepository.getProductPageIndex(id);

    if (ref.exists(productsListFutureProvider(pageId))) {
      return ref.watch(productFromListFutureProvider(id).future);
    }
    return _getProduct();
  }

  // Force provider to refresh product directly from the repository.
  void refresh() async {
    try {
      state = const AsyncLoading();
      state = await AsyncValue.guard(_getProduct);
    } catch (e) {
      if (e case StateError()) {
        return;
      }
      rethrow;
    }
  }
}

/// A provider that fetches a list of products from the repository, and then
/// returns a product from that list.
@riverpod
Future<Product> productFromListFuture(Ref ref, int id) async {
  final pageId = ProductRepository.getProductPageIndex(id);

  final questionPage = await ref.watch(
    productsListFutureProvider(pageId).future,
  );

  return questionPage[ProductRepository.getProductIndexInPage(id)];
}

/// A provider that fetches a list of products from the repository.
@riverpod
Future<List<Product>> productsListFuture(Ref ref, int pageId) async {
  final productRepository = ref.watch(productRepositoryProvider);

  final CancelToken cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final products = await productRepository.getProductsList(
    page: pageId,
    cancelToken: cancelToken,
  );

  return products;
}
