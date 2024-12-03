import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
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
    DatabaseKey? orderItemId,
    DatabaseKey? cartId,
  }) {
    return CartItemTableCompanion(
      orderItemId: Value.absentIfNull(orderItemId ?? orderItem.id),
      isIncludeInOrder: Value(isIncludeInOrder),
      cartId: Value.absentIfNull(cartId),
    );
  }
}

@DriftAccessor(tables: [CartItemTable])
class CartItemTableDao extends DatabaseAccessor<AppDatabase>
    with _$CartItemTableDaoMixin {
  CartItemTableDao(super.db);

  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected) {
    return (update(db.cartItemTable)
          ..where(
            (tbl) => tbl.orderItemId.equals(item.orderItem.id!),
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
