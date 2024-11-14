// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product.dart';

class ProductMapper extends ClassMapperBase<Product> {
  ProductMapper._();

  static ProductMapper? _instance;
  static ProductMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMapper._());
      ProductDimensionsMapper.ensureInitialized();
      ProductReviewsMapper.ensureInitialized();
      ProductMetaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Product';

  static int _$id(Product v) => v.id;
  static const Field<Product, int> _f$id = Field('id', _$id);
  static String _$title(Product v) => v.title;
  static const Field<Product, String> _f$title = Field('title', _$title);
  static String _$description(Product v) => v.description;
  static const Field<Product, String> _f$description =
      Field('description', _$description);
  static String _$category(Product v) => v.category;
  static const Field<Product, String> _f$category =
      Field('category', _$category);
  static double _$price(Product v) => v.price;
  static const Field<Product, double> _f$price = Field('price', _$price);
  static double _$discountPercentage(Product v) => v.discountPercentage;
  static const Field<Product, double> _f$discountPercentage =
      Field('discountPercentage', _$discountPercentage);
  static double _$rating(Product v) => v.rating;
  static const Field<Product, double> _f$rating = Field('rating', _$rating);
  static int _$stock(Product v) => v.stock;
  static const Field<Product, int> _f$stock = Field('stock', _$stock);
  static List<String> _$tags(Product v) => v.tags;
  static const Field<Product, List<String>> _f$tags = Field('tags', _$tags);
  static String? _$brand(Product v) => v.brand;
  static const Field<Product, String> _f$brand = Field('brand', _$brand);
  static String _$sku(Product v) => v.sku;
  static const Field<Product, String> _f$sku = Field('sku', _$sku);
  static int _$weight(Product v) => v.weight;
  static const Field<Product, int> _f$weight = Field('weight', _$weight);
  static ProductDimensions _$dimensions(Product v) => v.dimensions;
  static const Field<Product, ProductDimensions> _f$dimensions =
      Field('dimensions', _$dimensions);
  static String _$warrantyInformation(Product v) => v.warrantyInformation;
  static const Field<Product, String> _f$warrantyInformation =
      Field('warrantyInformation', _$warrantyInformation);
  static String _$shippingInformation(Product v) => v.shippingInformation;
  static const Field<Product, String> _f$shippingInformation =
      Field('shippingInformation', _$shippingInformation);
  static String _$availabilityStatus(Product v) => v.availabilityStatus;
  static const Field<Product, String> _f$availabilityStatus =
      Field('availabilityStatus', _$availabilityStatus);
  static List<ProductReviews> _$reviews(Product v) => v.reviews;
  static const Field<Product, List<ProductReviews>> _f$reviews =
      Field('reviews', _$reviews);
  static String _$returnPolicy(Product v) => v.returnPolicy;
  static const Field<Product, String> _f$returnPolicy =
      Field('returnPolicy', _$returnPolicy);
  static int _$minimumOrderQuantity(Product v) => v.minimumOrderQuantity;
  static const Field<Product, int> _f$minimumOrderQuantity =
      Field('minimumOrderQuantity', _$minimumOrderQuantity);
  static ProductMeta _$meta(Product v) => v.meta;
  static const Field<Product, ProductMeta> _f$meta = Field('meta', _$meta);
  static String _$thumbnail(Product v) => v.thumbnail;
  static const Field<Product, String> _f$thumbnail =
      Field('thumbnail', _$thumbnail);
  static List<String> _$images(Product v) => v.images;
  static const Field<Product, List<String>> _f$images =
      Field('images', _$images);
  static List<ProductVariantGroup> _$variantGroups(Product v) =>
      v.variantGroups;
  static const Field<Product, List<ProductVariantGroup>> _f$variantGroups =
      Field('variantGroups', _$variantGroups, mode: FieldMode.member);

  @override
  final MappableFields<Product> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #category: _f$category,
    #price: _f$price,
    #discountPercentage: _f$discountPercentage,
    #rating: _f$rating,
    #stock: _f$stock,
    #tags: _f$tags,
    #brand: _f$brand,
    #sku: _f$sku,
    #weight: _f$weight,
    #dimensions: _f$dimensions,
    #warrantyInformation: _f$warrantyInformation,
    #shippingInformation: _f$shippingInformation,
    #availabilityStatus: _f$availabilityStatus,
    #reviews: _f$reviews,
    #returnPolicy: _f$returnPolicy,
    #minimumOrderQuantity: _f$minimumOrderQuantity,
    #meta: _f$meta,
    #thumbnail: _f$thumbnail,
    #images: _f$images,
    #variantGroups: _f$variantGroups,
  };

  static Product _instantiate(DecodingData data) {
    return Product.mock(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        category: data.dec(_f$category),
        price: data.dec(_f$price),
        discountPercentage: data.dec(_f$discountPercentage),
        rating: data.dec(_f$rating),
        stock: data.dec(_f$stock),
        tags: data.dec(_f$tags),
        brand: data.dec(_f$brand),
        sku: data.dec(_f$sku),
        weight: data.dec(_f$weight),
        dimensions: data.dec(_f$dimensions),
        warrantyInformation: data.dec(_f$warrantyInformation),
        shippingInformation: data.dec(_f$shippingInformation),
        availabilityStatus: data.dec(_f$availabilityStatus),
        reviews: data.dec(_f$reviews),
        returnPolicy: data.dec(_f$returnPolicy),
        minimumOrderQuantity: data.dec(_f$minimumOrderQuantity),
        meta: data.dec(_f$meta),
        thumbnail: data.dec(_f$thumbnail),
        images: data.dec(_f$images));
  }

  @override
  final Function instantiate = _instantiate;

  static Product fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Product>(map);
  }

  static Product fromJsonString(String json) {
    return ensureInitialized().decodeJson<Product>(json);
  }
}

mixin ProductMappable {
  String toJsonString() {
    return ProductMapper.ensureInitialized()
        .encodeJson<Product>(this as Product);
  }

  Map<String, dynamic> toJson() {
    return ProductMapper.ensureInitialized()
        .encodeMap<Product>(this as Product);
  }

  ProductCopyWith<Product, Product, Product> get copyWith =>
      _ProductCopyWithImpl(this as Product, $identity, $identity);
  @override
  String toString() {
    return ProductMapper.ensureInitialized().stringifyValue(this as Product);
  }

  @override
  bool operator ==(Object other) {
    return ProductMapper.ensureInitialized()
        .equalsValue(this as Product, other);
  }

  @override
  int get hashCode {
    return ProductMapper.ensureInitialized().hashValue(this as Product);
  }
}

extension ProductValueCopy<$R, $Out> on ObjectCopyWith<$R, Product, $Out> {
  ProductCopyWith<$R, Product, $Out> get $asProduct =>
      $base.as((v, t, t2) => _ProductCopyWithImpl(v, t, t2));
}

abstract class ProductCopyWith<$R, $In extends Product, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ProductDimensionsCopyWith<$R, ProductDimensions, ProductDimensions>
      get dimensions;
  ListCopyWith<$R, ProductReviews,
      ProductReviewsCopyWith<$R, ProductReviews, ProductReviews>> get reviews;
  ProductMetaCopyWith<$R, ProductMeta, ProductMeta> get meta;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get images;
  $R call(
      {int? id,
      String? title,
      String? description,
      String? category,
      double? price,
      double? discountPercentage,
      double? rating,
      int? stock,
      List<String>? tags,
      String? brand,
      String? sku,
      int? weight,
      ProductDimensions? dimensions,
      String? warrantyInformation,
      String? shippingInformation,
      String? availabilityStatus,
      List<ProductReviews>? reviews,
      String? returnPolicy,
      int? minimumOrderQuantity,
      ProductMeta? meta,
      String? thumbnail,
      List<String>? images});
  ProductCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Product, $Out>
    implements ProductCopyWith<$R, Product, $Out> {
  _ProductCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Product> $mapper =
      ProductMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  ProductDimensionsCopyWith<$R, ProductDimensions, ProductDimensions>
      get dimensions =>
          $value.dimensions.copyWith.$chain((v) => call(dimensions: v));
  @override
  ListCopyWith<$R, ProductReviews,
          ProductReviewsCopyWith<$R, ProductReviews, ProductReviews>>
      get reviews => ListCopyWith($value.reviews,
          (v, t) => v.copyWith.$chain(t), (v) => call(reviews: v));
  @override
  ProductMetaCopyWith<$R, ProductMeta, ProductMeta> get meta =>
      $value.meta.copyWith.$chain((v) => call(meta: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get images =>
      ListCopyWith($value.images, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(images: v));
  @override
  $R call(
          {int? id,
          String? title,
          String? description,
          String? category,
          double? price,
          double? discountPercentage,
          double? rating,
          int? stock,
          List<String>? tags,
          Object? brand = $none,
          String? sku,
          int? weight,
          ProductDimensions? dimensions,
          String? warrantyInformation,
          String? shippingInformation,
          String? availabilityStatus,
          List<ProductReviews>? reviews,
          String? returnPolicy,
          int? minimumOrderQuantity,
          ProductMeta? meta,
          String? thumbnail,
          List<String>? images}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (category != null) #category: category,
        if (price != null) #price: price,
        if (discountPercentage != null) #discountPercentage: discountPercentage,
        if (rating != null) #rating: rating,
        if (stock != null) #stock: stock,
        if (tags != null) #tags: tags,
        if (brand != $none) #brand: brand,
        if (sku != null) #sku: sku,
        if (weight != null) #weight: weight,
        if (dimensions != null) #dimensions: dimensions,
        if (warrantyInformation != null)
          #warrantyInformation: warrantyInformation,
        if (shippingInformation != null)
          #shippingInformation: shippingInformation,
        if (availabilityStatus != null) #availabilityStatus: availabilityStatus,
        if (reviews != null) #reviews: reviews,
        if (returnPolicy != null) #returnPolicy: returnPolicy,
        if (minimumOrderQuantity != null)
          #minimumOrderQuantity: minimumOrderQuantity,
        if (meta != null) #meta: meta,
        if (thumbnail != null) #thumbnail: thumbnail,
        if (images != null) #images: images
      }));
  @override
  Product $make(CopyWithData data) => Product.mock(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      category: data.get(#category, or: $value.category),
      price: data.get(#price, or: $value.price),
      discountPercentage:
          data.get(#discountPercentage, or: $value.discountPercentage),
      rating: data.get(#rating, or: $value.rating),
      stock: data.get(#stock, or: $value.stock),
      tags: data.get(#tags, or: $value.tags),
      brand: data.get(#brand, or: $value.brand),
      sku: data.get(#sku, or: $value.sku),
      weight: data.get(#weight, or: $value.weight),
      dimensions: data.get(#dimensions, or: $value.dimensions),
      warrantyInformation:
          data.get(#warrantyInformation, or: $value.warrantyInformation),
      shippingInformation:
          data.get(#shippingInformation, or: $value.shippingInformation),
      availabilityStatus:
          data.get(#availabilityStatus, or: $value.availabilityStatus),
      reviews: data.get(#reviews, or: $value.reviews),
      returnPolicy: data.get(#returnPolicy, or: $value.returnPolicy),
      minimumOrderQuantity:
          data.get(#minimumOrderQuantity, or: $value.minimumOrderQuantity),
      meta: data.get(#meta, or: $value.meta),
      thumbnail: data.get(#thumbnail, or: $value.thumbnail),
      images: data.get(#images, or: $value.images));

  @override
  ProductCopyWith<$R2, Product, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductCopyWithImpl($value, $cast, t);
}
