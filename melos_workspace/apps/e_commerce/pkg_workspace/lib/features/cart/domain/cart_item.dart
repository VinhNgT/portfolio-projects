import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:objectbox/objectbox.dart';
import 'package:realm/realm.dart';

part 'cart_item.mapper.dart';
part 'cart_item.realm.dart';

@MappableClass()
class CartItem with CartItemMappable {
  /// The item that is added to the cart.
  final OrderItem orderItem;

  /// Whether the item is included in the order when the user checkouts the cart
  /// contains this item.
  final bool isIncludeInOrder;

  const CartItem({
    required this.orderItem,
    required this.isIncludeInOrder,
  });

  const CartItem.create({
    required this.orderItem,
    this.isIncludeInOrder = true,
  });

  CartItem.createWithProduct({
    required Product product,
  }) : this.create(orderItem: OrderItem.create(product: product));

  factory CartItem.fromRealmObj(CartItemRealm obj) =>
      CartItemRealmConverter.fromRealmObj(obj);
}

extension CartItemGetters on CartItem {
  Uuid get id => orderItem.id;
  // Product get product => orderItem.product;
  // double get price => orderItem.price;
  // double get shippingFee => orderItem.shippingFee;
}

extension CartItemMutations on CartItem {
  CartItem updateVariantSelection(
    ProductVariantIdsSelection variantSelection,
  ) {
    return copyWith(
      orderItem: orderItem.copyWith(variantSelection: variantSelection),
    );
  }

  CartItem mergeWith(CartItem other) {
    return copyWith(
      orderItem: orderItem.copyWith(
        quantity: orderItem.quantity + other.orderItem.quantity,
      ),
    );
  }
}

@Entity()
class CartItemObjBox {
  @Id()
  int objectBoxId = 0;

  @Index()
  @Unique(onConflict: ConflictStrategy.replace)
  final String id;
  final ToOne<OrderItemObjBox> orderItem;
  final bool isIncludeInOrder;

  CartItemObjBox({
    required this.id,
    required this.orderItem,
    required this.isIncludeInOrder,
  });

  factory CartItemObjBox.fromEntity(CartItem obj) {
    return CartItemObjBox(
      id: obj.id.toString(),
      orderItem: ToOne(target: OrderItemObjBox.fromEntity(obj.orderItem)),
      isIncludeInOrder: obj.isIncludeInOrder,
    );
  }

  CartItem toEntity() {
    return CartItem(
      orderItem: orderItem.target!.toEntity(),
      isIncludeInOrder: isIncludeInOrder,
    );
  }
}

@realm
class $CartItemRealm {
  @PrimaryKey()
  late Uuid id;

  late $OrderItemRealm? orderItem;
  late bool isIncludeInOrder;
}

extension CartItemRealmConverter on CartItem {
  static CartItem fromRealmObj(CartItemRealm obj) {
    return CartItem(
      orderItem: OrderItemRealmConverter.fromRealmObj(obj.orderItem!),
      isIncludeInOrder: obj.isIncludeInOrder,
    );
  }

  CartItemRealm toRealmObj(Realm realm) {
    return CartItemRealm(
      id: id,
      orderItem: orderItem.toRealmObj(realm),
      isIncludeInOrder: isIncludeInOrder,
    );
  }
}