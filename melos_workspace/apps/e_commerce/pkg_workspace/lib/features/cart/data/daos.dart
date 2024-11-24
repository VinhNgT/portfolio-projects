import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift/drift_provider.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:realm_common/realm_common.dart';

part 'daos.g.dart';

@DriftAccessor(tables: [CartItemTable])
class CartItemTableDao extends DatabaseAccessor<AppDatabase>
    with _$CartItemTableDaoMixin {
  CartItemTableDao(super.db);

  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected) {
    return (update(db.cartItemTable)
          ..where(
            (tbl) => tbl.orderItemId.equals(item.orderItem.id.toString()),
          ))
        .write(
      CartItemTableCompanion(
        isIncludeInOrder: Value(isSelected),
      ),
    );
  }

  Stream<List<CartItemTableData>> watchCartItems() {
    return select(db.cartItemTable).watch();
  }

  Future<List<CartItemTableData>> getCartItems() async {
    return select(db.cartItemTable).get();
  }
}

@DriftAccessor(tables: [OrderItemTable])
class OrderItemTableDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemTableDaoMixin {
  OrderItemTableDao(super.db);

  Stream<List<OrderItemTableData>> watchOrderItems() {
    return select(db.orderItemTable).watch();
  }

  Future<Uuid?> getExistingOrderItemId(
    List<String> orderItemVariantSelectionUuid,
  ) async {
    final distinctProductVariantCountExp =
        db.orderItemVariantSelectionTable.variantId.count(
      distinct: true,
    );

    final existingOrderItemQuery =
        select(db.orderItemVariantSelectionTable).join([])
          ..where(
            db.orderItemVariantSelectionTable.variantId.isIn(
              orderItemVariantSelectionUuid,
            ),
          )
          ..addColumns([
            distinctProductVariantCountExp,
          ])
          ..groupBy(
            [db.orderItemVariantSelectionTable.orderItemId],
            having: distinctProductVariantCountExp
                .equals(orderItemVariantSelectionUuid.length),
          );

    final rowResult = await existingOrderItemQuery.getSingleOrNull();
    final value =
        rowResult?.read(db.orderItemVariantSelectionTable.orderItemId);

    return value != null ? Uuid.fromString(value) : null;
  }

  Future<void> setOrderItemQuantity(Uuid itemId, int quantity) async {
    await (update(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(itemId.toString())))
        .write(
      OrderItemTableCompanion(
        quantity: Value(quantity),
      ),
    );
  }

  Future<void> addOrderItemQuantity(Uuid itemId, int quantity) async {
    await (update(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(itemId.toString())))
        .write(
      OrderItemTableCompanion.custom(
        quantity: db.orderItemTable.quantity + Variable(quantity),
      ),
    );
  }

  Future<OrderItemTableData?> getOrderItem(Uuid itemId) async {
    return (select(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(itemId.toString())))
        .getSingleOrNull();
  }

  Future<void> removeOrderItem(Uuid itemId) async {
    await (delete(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(itemId.toString())))
        .go();
  }
}

@DriftAccessor(tables: [OrderItemVariantSelectionTable])
class OrderItemVariantSelectionTableDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemVariantSelectionTableDaoMixin {
  OrderItemVariantSelectionTableDao(super.db);

  Future<void> addOrderItemVariantSelection(
    Uuid orderId,
    ProductVariantIdsSelection variantSelection,
  ) async {
    await db.transaction(() async {
      for (final variantId in variantSelection.values) {
        await db.into(db.orderItemVariantSelectionTable).insert(
              OrderItemVariantSelectionTableData(
                orderItemId: orderId.toString(),
                variantId: variantId.toString(),
              ),
            );
      }
    });
  }

  Future<List<OrderItemVariantSelectionTableData>> getOrderItemVariantSelection(
    Uuid orderId,
  ) async {
    return (select(db.orderItemVariantSelectionTable)
          ..where((tbl) => tbl.orderItemId.equals(orderId.toString())))
        .get();
  }

  Future<void> removeOrderItemVariantSelection(Uuid orderId) async {
    await (delete(db.orderItemVariantSelectionTable)
          ..where((tbl) => tbl.orderItemId.equals(orderId.toString())))
        .go();
  }
}
