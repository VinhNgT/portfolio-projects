import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_meta.mapper.dart';
part 'product_meta.realm.dart';

@MappableClass()
class ProductMeta with ProductMetaMappable {
  const ProductMeta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory ProductMeta.fromRealm(ProductMetaRealm realm) {
    return ProductMeta(
      createdAt: realm.createdAt,
      updatedAt: realm.updatedAt,
      barcode: realm.barcode,
      qrCode: realm.qrCode,
    );
  }

  ProductMetaRealm toRealm() {
    return ProductMetaRealm(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }

  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;
}

@realmEmbedded
class $ProductMetaRealm {
  late DateTime createdAt;
  late DateTime updatedAt;
  late String barcode;
  late String qrCode;
}
