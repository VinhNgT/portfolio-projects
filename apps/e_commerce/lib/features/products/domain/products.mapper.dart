// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'products.dart';

class ProductsMapper extends ClassMapperBase<Products> {
  ProductsMapper._();

  static ProductsMapper? _instance;
  static ProductsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductsMapper._());
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Products';

  static int _$id(Products v) => v.id;
  static const Field<Products, int> _f$id = Field('id', _$id);
  static List<Product> _$products(Products v) => v.products;
  static const Field<Products, List<Product>> _f$products =
      Field('products', _$products);
  static int _$total(Products v) => v.total;
  static const Field<Products, int> _f$total = Field('total', _$total);
  static int _$skip(Products v) => v.skip;
  static const Field<Products, int> _f$skip = Field('skip', _$skip);
  static int _$limit(Products v) => v.limit;
  static const Field<Products, int> _f$limit = Field('limit', _$limit);

  @override
  final MappableFields<Products> fields = const {
    #id: _f$id,
    #products: _f$products,
    #total: _f$total,
    #skip: _f$skip,
    #limit: _f$limit,
  };

  static Products _instantiate(DecodingData data) {
    return Products(
        id: data.dec(_f$id),
        products: data.dec(_f$products),
        total: data.dec(_f$total),
        skip: data.dec(_f$skip),
        limit: data.dec(_f$limit));
  }

  @override
  final Function instantiate = _instantiate;

  static Products fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Products>(map);
  }

  static Products fromJsonString(String json) {
    return ensureInitialized().decodeJson<Products>(json);
  }
}

mixin ProductsMappable {
  String toJsonString() {
    return ProductsMapper.ensureInitialized()
        .encodeJson<Products>(this as Products);
  }

  Map<String, dynamic> toJson() {
    return ProductsMapper.ensureInitialized()
        .encodeMap<Products>(this as Products);
  }

  ProductsCopyWith<Products, Products, Products> get copyWith =>
      _ProductsCopyWithImpl(this as Products, $identity, $identity);
  @override
  String toString() {
    return ProductsMapper.ensureInitialized().stringifyValue(this as Products);
  }

  @override
  bool operator ==(Object other) {
    return ProductsMapper.ensureInitialized()
        .equalsValue(this as Products, other);
  }

  @override
  int get hashCode {
    return ProductsMapper.ensureInitialized().hashValue(this as Products);
  }
}

extension ProductsValueCopy<$R, $Out> on ObjectCopyWith<$R, Products, $Out> {
  ProductsCopyWith<$R, Products, $Out> get $asProducts =>
      $base.as((v, t, t2) => _ProductsCopyWithImpl(v, t, t2));
}

abstract class ProductsCopyWith<$R, $In extends Products, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Product, ProductCopyWith<$R, Product, Product>> get products;
  $R call(
      {int? id, List<Product>? products, int? total, int? skip, int? limit});
  ProductsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Products, $Out>
    implements ProductsCopyWith<$R, Products, $Out> {
  _ProductsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Products> $mapper =
      ProductsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Product, ProductCopyWith<$R, Product, Product>>
      get products => ListCopyWith($value.products,
          (v, t) => v.copyWith.$chain(t), (v) => call(products: v));
  @override
  $R call(
          {int? id,
          List<Product>? products,
          int? total,
          int? skip,
          int? limit}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (products != null) #products: products,
        if (total != null) #total: total,
        if (skip != null) #skip: skip,
        if (limit != null) #limit: limit
      }));
  @override
  Products $make(CopyWithData data) => Products(
      id: data.get(#id, or: $value.id),
      products: data.get(#products, or: $value.products),
      total: data.get(#total, or: $value.total),
      skip: data.get(#skip, or: $value.skip),
      limit: data.get(#limit, or: $value.limit));

  @override
  ProductsCopyWith<$R2, Products, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductsCopyWithImpl($value, $cast, t);
}
