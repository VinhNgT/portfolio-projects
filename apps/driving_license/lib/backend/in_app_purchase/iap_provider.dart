import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iap_provider.g.dart';

@Riverpod(keepAlive: true)
InAppPurchase iap(IapRef ref) {
  return InAppPurchase.instance;
}
