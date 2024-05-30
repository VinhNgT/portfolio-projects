enum IapProductEntry {
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

  const IapProductEntry({required this.id, required this.imagePath});
  final String id;
  final String imagePath;
}

final iapProductEntryMap = {
  IapProductEntry.unlockFullAccess10k.id: IapProductEntry.unlockFullAccess10k,
  IapProductEntry.unlockFullAccess20k.id: IapProductEntry.unlockFullAccess20k,
  IapProductEntry.unlockFullAccess50k.id: IapProductEntry.unlockFullAccess50k,
  IapProductEntry.unlockFullAccess100k.id: IapProductEntry.unlockFullAccess100k,
  IapProductEntry.unlockFullAccess200k.id: IapProductEntry.unlockFullAccess200k,
  IapProductEntry.unlockFullAccess500k.id: IapProductEntry.unlockFullAccess500k,
};
