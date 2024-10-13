import 'package:driving_license/backend/in_app_purchase/data/purchases_repository.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/iap_service.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iap_providers.g.dart';

@Riverpod(keepAlive: true)
InAppPurchase iap(IapRef ref) {
  return InAppPurchase.instance;
}

@Riverpod(keepAlive: true)
Stream<List<PurchaseDetails>> purchaseDetailsListStream(
  PurchaseDetailsListStreamRef ref,
) {
  final iap = ref.watch(iapProvider);
  return iap.purchaseStream;
}

@riverpod
FutureOr<bool> isIapAvailable(IsIapAvailableRef ref) {
  final iap = ref.watch(iapProvider);
  return iap.isAvailable();
}

@riverpod
FutureOr<List<IapProduct>> iapProductsListFuture(
  IapProductsListFutureRef ref,
  List<IapProductEntry> iapProductEntries,
) async {
  final iapService = ref.watch(iapServiceProvider);
  return iapService.loadPurchases(iapProductEntries);
}

// @riverpod
// Stream<bool> isAnyPurchasePendingStream(IsAnyPurchasePendingStreamRef ref) {
//   final purchasesRepository = ref.watch(purchasesRepositoryProvider);
//   return purchasesRepository.watchIsAnyPending();
// }

@riverpod
Stream<bool> isAnyPurchaseCompletedStream(IsAnyPurchaseCompletedStreamRef ref) {
  final purchasesRepository = ref.watch(purchasesRepositoryProvider);
  return purchasesRepository.watchIsAnyPurchased();
}
