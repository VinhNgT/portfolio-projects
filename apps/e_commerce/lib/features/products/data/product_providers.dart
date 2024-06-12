import 'package:dio/dio.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

@riverpod
Future<Product> productFuture(ProductFutureRef ref, int id) {
  final productRepository = ref.watch(productRepositoryProvider);

  final CancelToken cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  return productRepository.getProduct(
    id: id,
    cancelToken: cancelToken,
  );
}

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
