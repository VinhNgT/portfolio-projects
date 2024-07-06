// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_meta.dart';

class ProductMetaMapper extends ClassMapperBase<ProductMeta> {
  ProductMetaMapper._();

  static ProductMetaMapper? _instance;
  static ProductMetaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMetaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductMeta';

  static DateTime? _$createdAt(ProductMeta v) => v.createdAt;
  static const Field<ProductMeta, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime? _$updatedAt(ProductMeta v) => v.updatedAt;
  static const Field<ProductMeta, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static String? _$barcode(ProductMeta v) => v.barcode;
  static const Field<ProductMeta, String> _f$barcode =
      Field('barcode', _$barcode);
  static String? _$qrCode(ProductMeta v) => v.qrCode;
  static const Field<ProductMeta, String> _f$qrCode = Field('qrCode', _$qrCode);

  @override
  final MappableFields<ProductMeta> fields = const {
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #barcode: _f$barcode,
    #qrCode: _f$qrCode,
  };

  static ProductMeta _instantiate(DecodingData data) {
    return ProductMeta(
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        barcode: data.dec(_f$barcode),
        qrCode: data.dec(_f$qrCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductMeta fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductMeta>(map);
  }

  static ProductMeta fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductMeta>(json);
  }
}

mixin ProductMetaMappable {
  String toJsonString() {
    return ProductMetaMapper.ensureInitialized()
        .encodeJson<ProductMeta>(this as ProductMeta);
  }

  Map<String, dynamic> toJson() {
    return ProductMetaMapper.ensureInitialized()
        .encodeMap<ProductMeta>(this as ProductMeta);
  }

  ProductMetaCopyWith<ProductMeta, ProductMeta, ProductMeta> get copyWith =>
      _ProductMetaCopyWithImpl(this as ProductMeta, $identity, $identity);
  @override
  String toString() {
    return ProductMetaMapper.ensureInitialized()
        .stringifyValue(this as ProductMeta);
  }

  @override
  bool operator ==(Object other) {
    return ProductMetaMapper.ensureInitialized()
        .equalsValue(this as ProductMeta, other);
  }

  @override
  int get hashCode {
    return ProductMetaMapper.ensureInitialized().hashValue(this as ProductMeta);
  }
}

extension ProductMetaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductMeta, $Out> {
  ProductMetaCopyWith<$R, ProductMeta, $Out> get $asProductMeta =>
      $base.as((v, t, t2) => _ProductMetaCopyWithImpl(v, t, t2));
}

abstract class ProductMetaCopyWith<$R, $In extends ProductMeta, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      String? barcode,
      String? qrCode});
  ProductMetaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductMetaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductMeta, $Out>
    implements ProductMetaCopyWith<$R, ProductMeta, $Out> {
  _ProductMetaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductMeta> $mapper =
      ProductMetaMapper.ensureInitialized();
  @override
  $R call(
          {Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? barcode = $none,
          Object? qrCode = $none}) =>
      $apply(FieldCopyWithData({
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (barcode != $none) #barcode: barcode,
        if (qrCode != $none) #qrCode: qrCode
      }));
  @override
  ProductMeta $make(CopyWithData data) => ProductMeta(
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      barcode: data.get(#barcode, or: $value.barcode),
      qrCode: data.get(#qrCode, or: $value.qrCode));

  @override
  ProductMetaCopyWith<$R2, ProductMeta, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductMetaCopyWithImpl($value, $cast, t);
}
