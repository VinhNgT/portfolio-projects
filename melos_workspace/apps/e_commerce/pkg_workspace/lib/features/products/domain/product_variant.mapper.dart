// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_variant.dart';

class ProductVariantMapper extends ClassMapperBase<ProductVariant> {
  ProductVariantMapper._();

  static ProductVariantMapper? _instance;
  static ProductVariantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductVariantMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductVariant';

  static int? _$id(ProductVariant v) => v.id;
  static const Field<ProductVariant, int> _f$id = Field('id', _$id);
  static String _$name(ProductVariant v) => v.name;
  static const Field<ProductVariant, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<ProductVariant> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static ProductVariant _instantiate(DecodingData data) {
    return ProductVariant(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductVariant fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductVariant>(map);
  }

  static ProductVariant fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductVariant>(json);
  }
}

mixin ProductVariantMappable {
  String toJsonString() {
    return ProductVariantMapper.ensureInitialized()
        .encodeJson<ProductVariant>(this as ProductVariant);
  }

  Map<String, dynamic> toJson() {
    return ProductVariantMapper.ensureInitialized()
        .encodeMap<ProductVariant>(this as ProductVariant);
  }

  ProductVariantCopyWith<ProductVariant, ProductVariant, ProductVariant>
      get copyWith => _ProductVariantCopyWithImpl(
          this as ProductVariant, $identity, $identity);
  @override
  String toString() {
    return ProductVariantMapper.ensureInitialized()
        .stringifyValue(this as ProductVariant);
  }

  @override
  bool operator ==(Object other) {
    return ProductVariantMapper.ensureInitialized()
        .equalsValue(this as ProductVariant, other);
  }

  @override
  int get hashCode {
    return ProductVariantMapper.ensureInitialized()
        .hashValue(this as ProductVariant);
  }
}

extension ProductVariantValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductVariant, $Out> {
  ProductVariantCopyWith<$R, ProductVariant, $Out> get $asProductVariant =>
      $base.as((v, t, t2) => _ProductVariantCopyWithImpl(v, t, t2));
}

abstract class ProductVariantCopyWith<$R, $In extends ProductVariant, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  ProductVariantCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductVariantCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductVariant, $Out>
    implements ProductVariantCopyWith<$R, ProductVariant, $Out> {
  _ProductVariantCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductVariant> $mapper =
      ProductVariantMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, String? name}) => $apply(FieldCopyWithData(
      {if (id != $none) #id: id, if (name != null) #name: name}));
  @override
  ProductVariant $make(CopyWithData data) => ProductVariant(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  ProductVariantCopyWith<$R2, ProductVariant, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductVariantCopyWithImpl($value, $cast, t);
}
