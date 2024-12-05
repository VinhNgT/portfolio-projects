import 'package:e_commerce/features/cart/data/cart_source.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@riverpod
Stream<Cart> cart(Ref ref) {
  return ref.watch(localCartSourceProvider).watchCart();
}
