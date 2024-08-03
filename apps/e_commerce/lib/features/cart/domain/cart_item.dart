import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'cart_item.mapper.dart';
part 'cart_item.realm.dart';

@realm
class $CartItemRealm {
  @PrimaryKey()
  late Uuid id;

  late $OrderItemRealm? orderItem;
  late bool isSelected;

  static CartItemRealm createRealmObj(Realm realm, CartItem obj) {
    return CartItemRealm(
      id: obj.id,
      orderItem: obj.orderItem.toRealmObj(realm),
      isSelected: obj.isSelected,
    );
  }
}

@MappableClass()
class CartItem with CartItemMappable {
  final OrderItem orderItem;
  final bool isSelected;

  const CartItem({
    required this.orderItem,
    required this.isSelected,
  });

  CartItem.create({
    required this.orderItem,
    this.isSelected = true,
  });

  factory CartItem.fromRealmObj(CartItemRealm obj) {
    return CartItem(
      orderItem: OrderItem.fromRealmObj(obj.orderItem!),
      isSelected: obj.isSelected,
    );
  }
}

extension CartItemGetters on CartItem {
  Uuid get id => orderItem.id;
  // Product get product => orderItem.product;
  // double get price => orderItem.price;
  // double get shippingFee => orderItem.shippingFee;
}

extension CartItemMutations on CartItem {
  CartItem updateSelectedVariants(List<ProductVariant> selectedVariants) {
    return CartItem(
      orderItem: orderItem.copyWith(selectedVariants: selectedVariants),
      isSelected: isSelected,
    );
  }

  CartItem mergeWith(CartItem other) {
    return CartItem(
      orderItem: orderItem.copyWith(
        quantity: orderItem.quantity + other.orderItem.quantity,
      ),
      isSelected: isSelected,
    );
  }
}
