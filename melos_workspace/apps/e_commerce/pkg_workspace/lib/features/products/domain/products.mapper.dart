// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'products.dart';

class ProductsLazyListMapper extends ClassMapperBase<ProductsLazyList> {
  ProductsLazyListMapper._();

  static ProductsLazyListMapper? _instance;
  static ProductsLazyListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductsLazyListMapper._());
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductsLazyList';

  static List<Product> _$products(ProductsLazyList v) => v.products;
  static const Field<ProductsLazyList, List<Product>> _f$products =
      Field('products', _$products);
  static int _$total(ProductsLazyList v) => v.total;
  static const Field<ProductsLazyList, int> _f$total = Field('total', _$total);
  static int _$skip(ProductsLazyList v) => v.skip;
  static const Field<ProductsLazyList, int> _f$skip = Field('skip', _$skip);
  static int _$limit(ProductsLazyList v) => v.limit;
  static const Field<ProductsLazyList, int> _f$limit = Field('limit', _$limit);

  @override
  final MappableFields<ProductsLazyList> fields = const {
    #products: _f$products,
    #total: _f$total,
    #skip: _f$skip,
    #limit: _f$limit,
  };

  static ProductsLazyList _instantiate(DecodingData data) {
    return ProductsLazyList(
        products: data.dec(_f$products),
        total: data.dec(_f$total),
        skip: data.dec(_f$skip),
        limit: data.dec(_f$limit));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductsLazyList fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductsLazyList>(map);
  }

  static ProductsLazyList fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductsLazyList>(json);
  }
}

mixin ProductsLazyListMappable {
  String toJsonString() {
    return ProductsLazyListMapper.ensureInitialized()
        .encodeJson<ProductsLazyList>(this as ProductsLazyList);
  }

  Map<String, dynamic> toJson() {
    return ProductsLazyListMapper.ensureInitialized()
        .encodeMap<ProductsLazyList>(this as ProductsLazyList);
  }

  ProductsLazyListCopyWith<ProductsLazyList, ProductsLazyList, ProductsLazyList>
      get copyWith => _ProductsLazyListCopyWithImpl(
          this as ProductsLazyList, $identity, $identity);
  @override
  String toString() {
    return ProductsLazyListMapper.ensureInitialized()
        .stringifyValue(this as ProductsLazyList);
  }

  @override
  bool operator ==(Object other) {
    return ProductsLazyListMapper.ensureInitialized()
        .equalsValue(this as ProductsLazyList, other);
  }

  @override
  int get hashCode {
    return ProductsLazyListMapper.ensureInitialized()
        .hashValue(this as ProductsLazyList);
  }
}

extension ProductsLazyListValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductsLazyList, $Out> {
  ProductsLazyListCopyWith<$R, ProductsLazyList, $Out>
      get $asProductsLazyList =>
          $base.as((v, t, t2) => _ProductsLazyListCopyWithImpl(v, t, t2));
}

abstract class ProductsLazyListCopyWith<$R, $In extends ProductsLazyList, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Product, ProductCopyWith<$R, Product, Product>> get products;
  $R call({List<Product>? products, int? total, int? skip, int? limit});
  ProductsLazyListCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductsLazyListCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductsLazyList, $Out>
    implements ProductsLazyListCopyWith<$R, ProductsLazyList, $Out> {
  _ProductsLazyListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductsLazyList> $mapper =
      ProductsLazyListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Product, ProductCopyWith<$R, Product, Product>>
      get products => ListCopyWith($value.products,
          (v, t) => v.copyWith.$chain(t), (v) => call(products: v));
  @override
  $R call({List<Product>? products, int? total, int? skip, int? limit}) =>
      $apply(FieldCopyWithData({
        if (products != null) #products: products,
        if (total != null) #total: total,
        if (skip != null) #skip: skip,
        if (limit != null) #limit: limit
      }));
  @override
  ProductsLazyList $make(CopyWithData data) => ProductsLazyList(
      products: data.get(#products, or: $value.products),
      total: data.get(#total, or: $value.total),
      skip: data.get(#skip, or: $value.skip),
      limit: data.get(#limit, or: $value.limit));

  @override
  ProductsLazyListCopyWith<$R2, ProductsLazyList, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductsLazyListCopyWithImpl($value, $cast, t);
}
