import 'package:driving_license/backend/database/sembast_provider.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'purchases_repository.g.dart';

/// Repository to save user purchase history.
class SembastPurchasesRepository {
  SembastPurchasesRepository(this.db);

  final Database db;
  final purchasesStore = stringMapStoreFactory.store('purchases');

  Future<void> savePurchaseOfId(String productId, {bool isPending = true}) {
    final purchase = IapProductPurchase(
      id: productId,
      state: isPending
          ? IapProductPurchaseState.pending
          : IapProductPurchaseState.purchased,
    );

    return purchasesStore.record(purchase.id).put(db, purchase.toJson());
  }

  Future<void> removePurchaseOf(IapProduct product) {
    return purchasesStore.record(product.id).delete(db);
  }

  Future<bool?> getIsPurchasePending(IapProduct product) async {
    final snapshot = await purchasesStore.record(product.id).get(db);
    if (snapshot == null) {
      return null;
    }

    final purchase = IapProductPurchase.fromJson(snapshot);
    return purchase.state == IapProductPurchaseState.pending;
  }

  Future<bool> getIsAnyPurchasePending() async {
    final snapshot = await purchasesStore.findFirst(
      db,
      finder: Finder(filter: Filter.equals('state', 'pending')),
    );
    if (snapshot == null) {
      return false;
    }

    return true;
  }

  Stream<IapProductPurchase?> watchPurchase(IapProduct product) {
    final recordSnapshotStream =
        purchasesStore.record(product.id).onSnapshot(db);

    return recordSnapshotStream.map((snapshot) {
      if (snapshot == null) {
        return null;
      }

      final purchaseJson = snapshot.value as Map<String, dynamic>;
      return IapProductPurchase.fromJson(purchaseJson);
    });
  }
}

@Riverpod(keepAlive: true)
SembastPurchasesRepository purchasesRepository(PurchasesRepositoryRef ref) {
  final db = ref.watch(sembastProvider).requireValue;
  return SembastPurchasesRepository(db);
}
