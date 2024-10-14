import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';

enum DonateProductEntry implements IapProductEntry {
  unlockFullAccess10k(
    id: 'unlock_full_access_10k',
    iconPath: 'assets/icons/donation/_compiled/coin.svg.vec',
  ),
  unlockFullAccess20k(
    id: 'unlock_full_access_20k',
    iconPath: 'assets/icons/donation/_compiled/coin_bag.svg.vec',
  ),
  unlockFullAccess50k(
    id: 'unlock_full_access_50k',
    iconPath: 'assets/icons/donation/_compiled/banknotes_coins.svg.vec',
  ),
  unlockFullAccess100k(
    id: 'unlock_full_access_100k',
    iconPath: 'assets/icons/donation/_compiled/banknotes.svg.vec',
  ),
  unlockFullAccess200k(
    id: 'unlock_full_access_200k',
    iconPath: 'assets/icons/donation/_compiled/diamond_gold.svg.vec',
  ),
  unlockFullAccess500k(
    id: 'unlock_full_access_500k',
    iconPath: 'assets/icons/donation/_compiled/diamond_blue.svg.vec',
  );

  const DonateProductEntry({required this.id, required this.iconPath});

  @override
  final String id;
  final String iconPath;
}
