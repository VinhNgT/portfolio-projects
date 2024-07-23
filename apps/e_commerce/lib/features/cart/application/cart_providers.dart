import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@riverpod
Stream<List<OrderItem>> cartItemsList(CartItemsListRef ref) {
  return ref.watch(cartRepositoryProvider).watchCartItems();
}

@riverpod
Stream<Order> cartOrder(CartOrderRef ref) {
  return ref.watch(cartRepositoryProvider).watchCartOrder();
}
