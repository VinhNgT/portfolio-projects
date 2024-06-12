import 'package:dio/dio.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/products.dart';
import 'package:e_commerce/networking/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  const ProductRepository(this.dio);

  final Dio dio;
  static const int productPageSizeLimit = 10;

  /// Fetches a [Product] by its [id].
  Future<Product> getProduct({
    required int id,
    CancelToken? cancelToken,
  }) async {
    if (id < 0) {
      throw ArgumentError('The id must be greater than or equal to 0');
    }

    final response = await dio.get(
      // The API id starts from 1
      '/products/${id + 1}',
      cancelToken: cancelToken,
    );
    return Product.fromJson(response.data);
  }

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
    return Products.fromJson(response.data).products!;
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final dio = ref.watch(dummyJsonDioProvider);
  return ProductRepository(dio);
}
