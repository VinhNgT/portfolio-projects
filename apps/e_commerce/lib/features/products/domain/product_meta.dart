import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_meta.freezed.dart';
part 'product_meta.g.dart';

@freezed
class ProductMeta with _$ProductMeta {
  const factory ProductMeta({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) = _ProductMeta;

  factory ProductMeta.fromJson(Map<String, Object?> json) =>
      _$ProductMetaFromJson(json);
}
