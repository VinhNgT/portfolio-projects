import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';

part 'cart_item_table.g.dart';

class CartItemTable extends Table {
  BoolColumn get isIncludeInOrder =>
      boolean().withDefault(const Constant(true))();

  IntColumn get orderItemId =>
      integer().references(OrderItemTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {orderItemId};
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
