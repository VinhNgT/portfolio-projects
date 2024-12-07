import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
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
    DriftLocalDatabase db,
    CartItemTableData data,
  ) async {
    final orderItem = await db.orderItemTableDao.getOrderItem(data.orderItemId);

    return CartItem(
      orderItem: orderItem!,
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
class CartItemTableDao extends DatabaseAccessor<DriftLocalDatabase> {
  CartItemTableDao(super.db);

  Future<DatabaseKey> addCartItem({
    required CartItem cartItem,
    required DatabaseKey cartId,
  }) {
    return db.transaction(() async {
      final dbOrderItemId = await db.orderItemTableDao.addOrderItem(
        orderItem: cartItem.orderItem,
      );

      final dbData = await into(db.cartItemTable).insertReturning(
        cartItem.toDbCompanion(
          orderItemId: dbOrderItemId,
          cartId: cartId,
        ),
      );

      return dbData.cartId;
    });
  }

  Future<List<CartItem>> getCartItemsForCart({
    required DatabaseKey cartId,
  }) async {
    final cartItems = await (select(db.cartItemTable)
          ..where((tbl) => tbl.cartId.equals(cartId)))
        .get();

    return Future.wait(cartItems.map((e) => CartItem.fromDbData(db, e)));
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
