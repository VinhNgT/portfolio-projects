import 'package:dio/dio.dart';
import 'package:e_commerce/backend/cache/cache_manager_provider.dart';
import 'package:e_commerce/backend/utils/object_serializer.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/products.dart';
import 'package:e_commerce/networking/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  const ProductRepository({
    required this.dio,
    required this.cacheManager,
  });

  final Dio dio;
  final CacheManager cacheManager;
  static const int productPageSizeLimit = 10;

  /// Fetches a [Product] by its [id].
  Future<Product> getProduct({
    required int id,
    CancelToken? cancelToken,
  }) async {
    if (id < 0) {
      throw ArgumentError('The id must be greater than or equal to 0');
    }

    return cacheManager.query(
      key: 'ProductRepository-getProduct-$id',
      queryFn: () async {
        final response = await dio.get(
          // The API id starts from 1
          '/products/${id + 1}',
          cancelToken: cancelToken,
        );

        return Product.fromJson(response.data!);
      },
      serializer: ObjectSerializer(
        fromJson: Product.fromJson,
        toJson: (product) => product.toJson(),
      ),
    );
  }

  /// Fetches a list of [Product]s with pagination.
  Future<List<Product>> getProductsList({
    required int page,
    CancelToken? cancelToken,
  }) async {
    if (page < 0) {
      throw ArgumentError('The page must be greater than or equal to 0');
    }

    return cacheManager.query(
      key: 'ProductRepository-getProductsList-$page',
      queryFn: () async {
        final response = await dio.get(
          '/products',
          queryParameters: {
            'limit': productPageSizeLimit,
            'skip': productPageSizeLimit * page,
          },
          cancelToken: cancelToken,
        );

        return Products.fromJson(response.data!).products!;
      },
      serializer: ObjectSerializer(
        fromJson: (productListJson) => [
          for (final productJson in productListJson['products'] as List)
            Product.fromJson(productJson as Map<String, dynamic>),
        ],
        toJson: (products) =>
            {'products': products.map((e) => e.toJson()).toList()},
      ),
    );
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final dio = ref.watch(dummyJsonDioProvider);
  final cacheManager = ref.read(cacheManagerProvider).requireValue;

  return ProductRepository(
    dio: dio,
    cacheManager: cacheManager,
  );
}
