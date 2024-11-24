import 'package:dart_mappable/dart_mappable.dart';

part 'product_meta.mapper.dart';

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

  factory ProductMeta.fromJson(Map<String, dynamic> json) =>
      ProductMetaMapper.fromJson(json);
}
