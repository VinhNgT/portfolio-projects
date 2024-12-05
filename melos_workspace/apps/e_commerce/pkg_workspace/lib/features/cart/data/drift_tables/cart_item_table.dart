import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'cart_item_table.g.dart';

class CartItemTable extends Table {
  BoolColumn get isIncludeInOrder =>
      boolean().withDefault(const Constant(true))();

  IntColumn get orderItemId =>
      integer().references(OrderItemTable, #id, onDelete: KeyAction.cascade)();

  IntColumn get cartId => integer().references(CartTable, #id)();

  @override
  Set<Column> get primaryKey => {orderItemId};
}

extension CartItemTableDomainConverter on CartItem {
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

  CartItemTableCompanion toDbCompanion({
    required DatabaseKey? orderItemId,
    required DatabaseKey? cartId,
  }) {
    return CartItemTableCompanion(
      orderItemId: Value.absentIfNull(orderItemId ?? orderItem.id),
      isIncludeInOrder: Value(isIncludeInOrder),
      cartId: Value.absentIfNull(cartId),
    );
  }
}

@DriftAccessor()
class CartItemTableDao extends DatabaseAccessor<AppDatabase> {
  CartItemTableDao(super.db);

  Future<CartItem> addCartItem({
    required CartItem cartItem,
    required DatabaseKey cartId,
  }) {
    return db.transaction(() async {
      final dbOrderItemId = await db.orderItemTableDao.addOrderItem(
        orderItem: cartItem.orderItem,
      );

      final dbCartItem = await into(db.cartItemTable).insertReturning(
        cartItem.toDbCompanion(
          orderItemId: dbOrderItemId,
          cartId: cartId,
        ),
      );

      return CartItem.fromDbData(db, dbCartItem);
    });
  }

  Future<CartItem?> getCartItemFromVariantSelection({
    required ProductVariantIdsSelection variantSelection,
  }) async {
    final countSelectionExp = db.orderItemVariantSelectionTable.variantId.count(
      distinct: true,
    );

    final query = select(db.cartItemTable).join([
      innerJoin(
        db.orderItemTable,
        db.orderItemTable.id.equalsExp(db.cartItemTable.orderItemId),
      ),
      innerJoin(
        db.orderItemVariantSelectionTable,
        db.orderItemVariantSelectionTable.orderItemId
            .equalsExp(db.orderItemTable.id),
        useColumns: false,
      ),
    ])
      ..where(
        db.orderItemVariantSelectionTable.variantId.isIn(
          variantSelection.values.map((e) => e!),
        ),
      )
      ..addColumns([countSelectionExp])
      ..groupBy(
        [db.orderItemTable.id],
        having: countSelectionExp.equals(variantSelection.values.length),
      );

    final result = await query
        .map((row) => row.readTable(db.cartItemTable))
        .getSingleOrNull();

    return result != null ? CartItem.fromDbData(db, result) : null;
  }

  Future<void> setItemOrderInclusionState(DatabaseKey itemId, bool isSelected) {
    return (update(db.cartItemTable)
          ..where(
            (tbl) => tbl.orderItemId.equals(itemId),
          ))
        .write(
      CartItemTableCompanion(
        isIncludeInOrder: Value(isSelected),
      ),
    );
  }

  Stream<List<CartItem>> watchCartItemsAndChilds({
    required DatabaseKey cartId,
  }) {
    final query = select(db.cartItemTable).join([
      innerJoin(
        db.orderItemTable,
        db.orderItemTable.id.equalsExp(db.cartItemTable.orderItemId),
      ),
    ])
      ..where(db.cartItemTable.cartId.equals(cartId));

    return query.watch().asyncMap(
          (rows) => Future.wait(
            rows.map(
              (e) => CartItem.fromDbData(db, e.readTable(db.cartItemTable)),
            ),
          ),
        );
  }
}
