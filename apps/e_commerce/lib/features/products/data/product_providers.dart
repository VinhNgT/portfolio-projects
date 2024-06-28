import 'package:dio/dio.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
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
    final pageNumber = id ~/ ProductRepository.productPageSizeLimit;

    if (ref.exists(productsListFutureProvider(pageNumber))) {
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
Future<Product> productFromListFuture(
  ProductFromListFutureRef ref,
  int id,
) async {
  final pageNumber = id ~/ ProductRepository.productPageSizeLimit;

  final questionPage = await ref.watch(
    productsListFutureProvider(pageNumber).future,
  );

  return questionPage[id % ProductRepository.productPageSizeLimit];
}

/// A provider that fetches a list of products from the repository.
@riverpod
Future<List<Product>> productsListFuture(
  ProductsListFutureRef ref,
  int page,
) async {
  final productRepository = ref.watch(productRepositoryProvider);

  final CancelToken cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final products = await productRepository.getProductsList(
    page: page,
    cancelToken: cancelToken,
  );

  return products;
}
