import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';

enum DonateProductEntry implements IapProductEntry {
  unlockFullAccess10k(
    id: 'unlock_full_access_10k',
    imagePath: 'assets/images/bank_notes/10k.jpg',
  ),
  unlockFullAccess20k(
    id: 'unlock_full_access_20k',
    imagePath: 'assets/images/bank_notes/20k.jpg',
  ),
  unlockFullAccess50k(
    id: 'unlock_full_access_50k',
    imagePath: 'assets/images/bank_notes/50k.jpg',
  ),
  unlockFullAccess100k(
    id: 'unlock_full_access_100k',
    imagePath: 'assets/images/bank_notes/100k.jpg',
  ),
  unlockFullAccess200k(
    id: 'unlock_full_access_200k',
    imagePath: 'assets/images/bank_notes/200k.jpg',
  ),
  unlockFullAccess500k(
    id: 'unlock_full_access_500k',
    imagePath: 'assets/images/bank_notes/500k.jpg',
  );

  const DonateProductEntry({required this.id, required this.imagePath});

  @override
  final String id;
  final String imagePath;
}
