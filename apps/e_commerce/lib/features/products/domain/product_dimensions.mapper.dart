// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_dimensions.dart';

class ProductDimensionsMapper extends ClassMapperBase<ProductDimensions> {
  ProductDimensionsMapper._();

  static ProductDimensionsMapper? _instance;
  static ProductDimensionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductDimensionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductDimensions';

  static double _$width(ProductDimensions v) => v.width;
  static const Field<ProductDimensions, double> _f$width =
      Field('width', _$width);
  static double _$height(ProductDimensions v) => v.height;
  static const Field<ProductDimensions, double> _f$height =
      Field('height', _$height);
  static double _$depth(ProductDimensions v) => v.depth;
  static const Field<ProductDimensions, double> _f$depth =
      Field('depth', _$depth);

  @override
  final MappableFields<ProductDimensions> fields = const {
    #width: _f$width,
    #height: _f$height,
    #depth: _f$depth,
  };

  static ProductDimensions _instantiate(DecodingData data) {
    return ProductDimensions(
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        depth: data.dec(_f$depth));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductDimensions fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductDimensions>(map);
  }

  static ProductDimensions fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductDimensions>(json);
  }
}

mixin ProductDimensionsMappable {
  String toJsonString() {
    return ProductDimensionsMapper.ensureInitialized()
        .encodeJson<ProductDimensions>(this as ProductDimensions);
  }

  Map<String, dynamic> toJson() {
    return ProductDimensionsMapper.ensureInitialized()
        .encodeMap<ProductDimensions>(this as ProductDimensions);
  }

  ProductDimensionsCopyWith<ProductDimensions, ProductDimensions,
          ProductDimensions>
      get copyWith => _ProductDimensionsCopyWithImpl(
          this as ProductDimensions, $identity, $identity);
  @override
  String toString() {
    return ProductDimensionsMapper.ensureInitialized()
        .stringifyValue(this as ProductDimensions);
  }

  @override
  bool operator ==(Object other) {
    return ProductDimensionsMapper.ensureInitialized()
        .equalsValue(this as ProductDimensions, other);
  }

  @override
  int get hashCode {
    return ProductDimensionsMapper.ensureInitialized()
        .hashValue(this as ProductDimensions);
  }
}

extension ProductDimensionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductDimensions, $Out> {
  ProductDimensionsCopyWith<$R, ProductDimensions, $Out>
      get $asProductDimensions =>
          $base.as((v, t, t2) => _ProductDimensionsCopyWithImpl(v, t, t2));
}

abstract class ProductDimensionsCopyWith<$R, $In extends ProductDimensions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, double? height, double? depth});
  ProductDimensionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductDimensionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductDimensions, $Out>
    implements ProductDimensionsCopyWith<$R, ProductDimensions, $Out> {
  _ProductDimensionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductDimensions> $mapper =
      ProductDimensionsMapper.ensureInitialized();
  @override
  $R call({double? width, double? height, double? depth}) =>
      $apply(FieldCopyWithData({
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (depth != null) #depth: depth
      }));
  @override
  ProductDimensions $make(CopyWithData data) => ProductDimensions(
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      depth: data.get(#depth, or: $value.depth));

  @override
  ProductDimensionsCopyWith<$R2, ProductDimensions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductDimensionsCopyWithImpl($value, $cast, t);
}
