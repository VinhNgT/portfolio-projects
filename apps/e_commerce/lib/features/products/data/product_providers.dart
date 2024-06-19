import 'package:dio/dio.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

/// A provider that fetches a product from the repository.
@riverpod
FutureOr<Product> productFuture(ProductFutureRef ref, int id) async {
  final pageNumber = id ~/ ProductRepository.productPageSizeLimit;

  if (ref.exists(productsListFutureProvider(pageNumber))) {
    return ref.watch(productFromListFutureProvider(id).future);
  }

  final productRepository = ref.watch(productRepositoryProvider);
  final CancelToken cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  return productRepository.getProduct(
    id: id,
    cancelToken: cancelToken,
  );
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
