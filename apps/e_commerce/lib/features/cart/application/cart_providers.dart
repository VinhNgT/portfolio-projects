import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@riverpod
Stream<List<CartItem>> cartItemsList(CartItemsListRef ref) {
  return ref.watch(cartRepositoryProvider).watchCartItems();
}
