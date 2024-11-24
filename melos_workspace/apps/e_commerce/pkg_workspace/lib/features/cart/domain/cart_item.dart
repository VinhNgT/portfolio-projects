import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:sane_uuid/uuid.dart';

part 'cart_item.mapper.dart';

class CartItemTable extends Table {
  BoolColumn get isIncludeInOrder =>
      boolean().withDefault(const Constant(true))();

  TextColumn get orderItemId =>
      text().references(OrderItemTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {orderItemId};
}

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

  CartItemTableData toDbData() {
    return CartItemTableData(
      orderItemId: orderItem.id.toString(),
      isIncludeInOrder: isIncludeInOrder,
    );
  }

  static Future<CartItem> fromDbData(
    AppDatabase db,
    CartItemTableData data,
  ) async {
    final orderItem = await (db.select(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(data.orderItemId)))
        .getSingle();

    return CartItem(
      orderItem: await OrderItem.fromDbData(db, orderItem),
      isIncludeInOrder: data.isIncludeInOrder,
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
