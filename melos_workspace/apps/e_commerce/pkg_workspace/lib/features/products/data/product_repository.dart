import 'package:dio/dio.dart';
import 'package:e_commerce/backend/cache/client_cache_manager_provider.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/products.dart';
import 'package:e_commerce/networking/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  const ProductRepository({
    required this.dio,
    required this.clientCacheManager,
  });

  final Dio dio;
  final ClientCacheManager clientCacheManager;
  static const int productPageSizeLimit = 10;

  /// Returns the page index of a product in a paginated list. Returns 0-based
  /// page index.
  ///
  /// Example when [productPageSizeLimit] is `10`:
  ///   - getProductPageIndex(1) => 0
  ///   - getProductPageIndex(10) => 0
  ///   - getProductPageIndex(11) => 1
  ///   - getProductPageIndex(23) => 2
  static int getProductPageIndex(int productId) =>
      (productId - 1) ~/ productPageSizeLimit;

  /// Returns the index of a product in a page. Returns 0-based index.
  ///
  /// Example when [productPageSizeLimit] is `10`:
  ///   - getProductIndexInPage(1) => 0
  ///   - getProductIndexInPage(10) => 9
  ///   - getProductIndexInPage(11) => 0
  ///   - getProductIndexInPage(23) => 2
  static int getProductIndexInPage(int productId) =>
      (productId - 1) % productPageSizeLimit;

  /// Fetches a [Product] by its [id].
  Future<Product> getProduct({
    required int id,
    CancelToken? cancelToken,
  }) async {
    if (id < 1) {
      throw ArgumentError('The id must be greater than or equal to 1');
    }

    final response = await dio.get(
      '/products/$id',
      cancelToken: cancelToken,
    );

    return ProductMapper.fromJson(response.data!);
  }

  /// Fetches a list of [Product]s with pagination.
  Future<List<Product>> getProductsList({
    required int page,
    CancelToken? cancelToken,
  }) async {
    if (page < 0) {
      throw ArgumentError('The page must be greater than or equal to 0');
    }

    final response = await dio.get(
      '/products',
      queryParameters: {
        'limit': productPageSizeLimit,
        'skip': productPageSizeLimit * page,
      },
      cancelToken: cancelToken,
    );

    return ProductsLazyListMapper.fromJson(response.data!).products;
  }
}

@riverpod
ProductRepository productRepository(Ref ref) {
  final dio = ref.watch(dummyJsonDioProvider);
  final cacheManager = ref.watch(clientCacheManagerProvider).requireValue;

  return ProductRepository(
    dio: dio,
    clientCacheManager: cacheManager,
  );
}
