import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'cart_table.g.dart';

class CartTable extends Table {
  IntColumn get id => integer().autoIncrement()();
}

extension CartTableDomainConverter on Cart {
  static Future<Cart> fromDbData(
    DriftLocalDatabase db,
    CartTableData data,
  ) async {
    final cartItems =
        await db.cartItemTableDao.getCartItemsForCart(cartId: data.id);

    return Cart(
      id: data.id,
      cartItems: cartItems,
    );
  }

  CartTableCompanion toDbCompanion() {
    return CartTableCompanion(
      id: Value.absentIfNull(id),
    );
  }
}

@DriftAccessor()
class CartTableDao extends DatabaseAccessor<DriftLocalDatabase> {
  CartTableDao(super.db);

  Future<CartTableData> addCart({required Cart cart}) {
    return db.transaction(() async {
      final dbCart =
          await into(db.cartTable).insertReturning(cart.toDbCompanion());

      for (final cartItem in cart.cartItems) {
        await db.cartItemTableDao.addCartItem(
          cartItem: cartItem,
          cartId: dbCart.id,
        );
      }

      return dbCart;
    });
  }

  Future<bool> checkCartExists({required DatabaseKey cartId}) async {
    final cartExistsStm = db.selectOnly(db.cartTable)
      ..addColumns([db.cartTable.id])
      ..where(db.cartTable.id.equals(cartId));

    final cartExists = await cartExistsStm.getSingleOrNull() != null;
    return cartExists;
  }
}
