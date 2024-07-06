// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_reviews.dart';

class ProductReviewsMapper extends ClassMapperBase<ProductReviews> {
  ProductReviewsMapper._();

  static ProductReviewsMapper? _instance;
  static ProductReviewsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductReviewsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductReviews';

  static int? _$rating(ProductReviews v) => v.rating;
  static const Field<ProductReviews, int> _f$rating = Field('rating', _$rating);
  static String? _$comment(ProductReviews v) => v.comment;
  static const Field<ProductReviews, String> _f$comment =
      Field('comment', _$comment);
  static String? _$date(ProductReviews v) => v.date;
  static const Field<ProductReviews, String> _f$date = Field('date', _$date);
  static String? _$reviewerName(ProductReviews v) => v.reviewerName;
  static const Field<ProductReviews, String> _f$reviewerName =
      Field('reviewerName', _$reviewerName);
  static String? _$reviewerEmail(ProductReviews v) => v.reviewerEmail;
  static const Field<ProductReviews, String> _f$reviewerEmail =
      Field('reviewerEmail', _$reviewerEmail);

  @override
  final MappableFields<ProductReviews> fields = const {
    #rating: _f$rating,
    #comment: _f$comment,
    #date: _f$date,
    #reviewerName: _f$reviewerName,
    #reviewerEmail: _f$reviewerEmail,
  };

  static ProductReviews _instantiate(DecodingData data) {
    return ProductReviews(
        rating: data.dec(_f$rating),
        comment: data.dec(_f$comment),
        date: data.dec(_f$date),
        reviewerName: data.dec(_f$reviewerName),
        reviewerEmail: data.dec(_f$reviewerEmail));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductReviews fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductReviews>(map);
  }

  static ProductReviews fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductReviews>(json);
  }
}

mixin ProductReviewsMappable {
  String toJsonString() {
    return ProductReviewsMapper.ensureInitialized()
        .encodeJson<ProductReviews>(this as ProductReviews);
  }

  Map<String, dynamic> toJson() {
    return ProductReviewsMapper.ensureInitialized()
        .encodeMap<ProductReviews>(this as ProductReviews);
  }

  ProductReviewsCopyWith<ProductReviews, ProductReviews, ProductReviews>
      get copyWith => _ProductReviewsCopyWithImpl(
          this as ProductReviews, $identity, $identity);
  @override
  String toString() {
    return ProductReviewsMapper.ensureInitialized()
        .stringifyValue(this as ProductReviews);
  }

  @override
  bool operator ==(Object other) {
    return ProductReviewsMapper.ensureInitialized()
        .equalsValue(this as ProductReviews, other);
  }

  @override
  int get hashCode {
    return ProductReviewsMapper.ensureInitialized()
        .hashValue(this as ProductReviews);
  }
}

extension ProductReviewsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductReviews, $Out> {
  ProductReviewsCopyWith<$R, ProductReviews, $Out> get $asProductReviews =>
      $base.as((v, t, t2) => _ProductReviewsCopyWithImpl(v, t, t2));
}

abstract class ProductReviewsCopyWith<$R, $In extends ProductReviews, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? rating,
      String? comment,
      String? date,
      String? reviewerName,
      String? reviewerEmail});
  ProductReviewsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductReviewsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductReviews, $Out>
    implements ProductReviewsCopyWith<$R, ProductReviews, $Out> {
  _ProductReviewsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductReviews> $mapper =
      ProductReviewsMapper.ensureInitialized();
  @override
  $R call(
          {Object? rating = $none,
          Object? comment = $none,
          Object? date = $none,
          Object? reviewerName = $none,
          Object? reviewerEmail = $none}) =>
      $apply(FieldCopyWithData({
        if (rating != $none) #rating: rating,
        if (comment != $none) #comment: comment,
        if (date != $none) #date: date,
        if (reviewerName != $none) #reviewerName: reviewerName,
        if (reviewerEmail != $none) #reviewerEmail: reviewerEmail
      }));
  @override
  ProductReviews $make(CopyWithData data) => ProductReviews(
      rating: data.get(#rating, or: $value.rating),
      comment: data.get(#comment, or: $value.comment),
      date: data.get(#date, or: $value.date),
      reviewerName: data.get(#reviewerName, or: $value.reviewerName),
      reviewerEmail: data.get(#reviewerEmail, or: $value.reviewerEmail));

  @override
  ProductReviewsCopyWith<$R2, ProductReviews, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductReviewsCopyWithImpl($value, $cast, t);
}
