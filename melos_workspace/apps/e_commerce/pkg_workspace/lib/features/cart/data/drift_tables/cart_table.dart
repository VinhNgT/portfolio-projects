import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';

class CartTable extends Table {
  IntColumn get id => integer().autoIncrement()();
}

extension CartTableDomainConverter on Cart {
  static Future<Cart> fromDbData(
    AppDatabase db,
    CartTableData data,
  ) async {
    final cartItems = await (db.select(db.cartItemTable)
          ..where((tbl) => tbl.cartId.equals(data.id)))
        .get();

    return Cart(
      id: data.id,
      cartItems:
          await Future.wait(cartItems.map((e) => CartItem.fromDbData(db, e))),
    );
  }

  CartTableCompanion toDbCompanion() {
    return CartTableCompanion(
      id: Value.absentIfNull(id),
    );
  }
}
