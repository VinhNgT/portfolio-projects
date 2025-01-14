import 'package:e_commerce/features/cart/data/cart_source.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/data/product_repository.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_data_service.g.dart';

class MockDataService {
  MockDataService({
    required this.logger,
    required this.localCart,
    required this.productRepository,
  });

  final Logger logger;
  final CartSource localCart;
  final ProductRepository productRepository;

  // Fill the cart with items taken from the first page of the products list.
  Future<void> fillCart({bool forceClearCart = true}) async {
    logger.i('Filling cart with mock data');

    if (forceClearCart) {
      await localCart.clearCart();
    }

    if (await localCart.getCartItemsCount() == 0) {
      final products = await productRepository.getProductsList(page: 0);

      await localCart.addAllCartItems(
        Iterable.generate(
          products.length,
          (index) => CartItem.create(
            orderItem: OrderItem(
              product: products[index],
              variantSelection: {
                for (final group in products[index].variantGroups)
                  group.id!: group.variants.first.id!,
              },
              quantity: 5,
            ),
          ),
        ),
      );
    }
  }
}

@riverpod
MockDataService mockDataService(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final localCart = ref.watch(localCartSourceProvider);
  final productRepository = ref.watch(productRepositoryProvider);

  return MockDataService(
    logger: logger,
    localCart: localCart,
    productRepository: productRepository,
  );
}
