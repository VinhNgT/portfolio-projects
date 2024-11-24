// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_variant_group.dart';

class ProductVariantGroupMapper extends ClassMapperBase<ProductVariantGroup> {
  ProductVariantGroupMapper._();

  static ProductVariantGroupMapper? _instance;
  static ProductVariantGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductVariantGroupMapper._());
      ProductVariantMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductVariantGroup';

  static int? _$id(ProductVariantGroup v) => v.id;
  static const Field<ProductVariantGroup, int> _f$id =
      Field('id', _$id, opt: true);
  static String _$groupName(ProductVariantGroup v) => v.groupName;
  static const Field<ProductVariantGroup, String> _f$groupName =
      Field('groupName', _$groupName);
  static List<ProductVariant> _$variants(ProductVariantGroup v) => v.variants;
  static const Field<ProductVariantGroup, List<ProductVariant>> _f$variants =
      Field('variants', _$variants, opt: true, def: const []);

  @override
  final MappableFields<ProductVariantGroup> fields = const {
    #id: _f$id,
    #groupName: _f$groupName,
    #variants: _f$variants,
  };

  static ProductVariantGroup _instantiate(DecodingData data) {
    return ProductVariantGroup(
        id: data.dec(_f$id),
        groupName: data.dec(_f$groupName),
        variants: data.dec(_f$variants));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductVariantGroup fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductVariantGroup>(map);
  }

  static ProductVariantGroup fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductVariantGroup>(json);
  }
}

mixin ProductVariantGroupMappable {
  String toJsonString() {
    return ProductVariantGroupMapper.ensureInitialized()
        .encodeJson<ProductVariantGroup>(this as ProductVariantGroup);
  }

  Map<String, dynamic> toJson() {
    return ProductVariantGroupMapper.ensureInitialized()
        .encodeMap<ProductVariantGroup>(this as ProductVariantGroup);
  }

  ProductVariantGroupCopyWith<ProductVariantGroup, ProductVariantGroup,
          ProductVariantGroup>
      get copyWith => _ProductVariantGroupCopyWithImpl(
          this as ProductVariantGroup, $identity, $identity);
  @override
  String toString() {
    return ProductVariantGroupMapper.ensureInitialized()
        .stringifyValue(this as ProductVariantGroup);
  }

  @override
  bool operator ==(Object other) {
    return ProductVariantGroupMapper.ensureInitialized()
        .equalsValue(this as ProductVariantGroup, other);
  }

  @override
  int get hashCode {
    return ProductVariantGroupMapper.ensureInitialized()
        .hashValue(this as ProductVariantGroup);
  }
}

extension ProductVariantGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductVariantGroup, $Out> {
  ProductVariantGroupCopyWith<$R, ProductVariantGroup, $Out>
      get $asProductVariantGroup =>
          $base.as((v, t, t2) => _ProductVariantGroupCopyWithImpl(v, t, t2));
}

abstract class ProductVariantGroupCopyWith<$R, $In extends ProductVariantGroup,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ProductVariant,
      ProductVariantCopyWith<$R, ProductVariant, ProductVariant>> get variants;
  $R call({int? id, String? groupName, List<ProductVariant>? variants});
  ProductVariantGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductVariantGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductVariantGroup, $Out>
    implements ProductVariantGroupCopyWith<$R, ProductVariantGroup, $Out> {
  _ProductVariantGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductVariantGroup> $mapper =
      ProductVariantGroupMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ProductVariant,
          ProductVariantCopyWith<$R, ProductVariant, ProductVariant>>
      get variants => ListCopyWith($value.variants,
          (v, t) => v.copyWith.$chain(t), (v) => call(variants: v));
  @override
  $R call(
          {Object? id = $none,
          String? groupName,
          List<ProductVariant>? variants}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (groupName != null) #groupName: groupName,
        if (variants != null) #variants: variants
      }));
  @override
  ProductVariantGroup $make(CopyWithData data) => ProductVariantGroup(
      id: data.get(#id, or: $value.id),
      groupName: data.get(#groupName, or: $value.groupName),
      variants: data.get(#variants, or: $value.variants));

  @override
  ProductVariantGroupCopyWith<$R2, ProductVariantGroup, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductVariantGroupCopyWithImpl($value, $cast, t);
}
