import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_meta.mapper.dart';
part 'product_meta.realm.dart';

@MappableClass()
class ProductMeta with ProductMetaMappable {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  const ProductMeta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory ProductMeta.fromRealmObj(ProductMetaRealm obj) =>
      ProductMetaRealmConverter.fromRealmObj(obj);
}

@realmEmbedded
class $ProductMetaRealm {
  late DateTime createdAt;
  late DateTime updatedAt;
  late String barcode;
  late String qrCode;
}

extension ProductMetaRealmConverter on ProductMeta {
  static ProductMeta fromRealmObj(ProductMetaRealm obj) {
    return ProductMeta(
      createdAt: obj.createdAt,
      updatedAt: obj.updatedAt,
      barcode: obj.barcode,
      qrCode: obj.qrCode,
    );
  }

  ProductMetaRealm toRealmObj() {
    return ProductMetaRealm(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }
}
