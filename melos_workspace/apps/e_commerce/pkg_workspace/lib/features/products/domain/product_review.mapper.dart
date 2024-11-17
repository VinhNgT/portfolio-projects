// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_review.dart';

class ProductReviewMapper extends ClassMapperBase<ProductReview> {
  ProductReviewMapper._();

  static ProductReviewMapper? _instance;
  static ProductReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductReviewMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductReview';

  static int _$rating(ProductReview v) => v.rating;
  static const Field<ProductReview, int> _f$rating = Field('rating', _$rating);
  static String _$comment(ProductReview v) => v.comment;
  static const Field<ProductReview, String> _f$comment =
      Field('comment', _$comment);
  static String _$date(ProductReview v) => v.date;
  static const Field<ProductReview, String> _f$date = Field('date', _$date);
  static String _$reviewerName(ProductReview v) => v.reviewerName;
  static const Field<ProductReview, String> _f$reviewerName =
      Field('reviewerName', _$reviewerName);
  static String _$reviewerEmail(ProductReview v) => v.reviewerEmail;
  static const Field<ProductReview, String> _f$reviewerEmail =
      Field('reviewerEmail', _$reviewerEmail);

  @override
  final MappableFields<ProductReview> fields = const {
    #rating: _f$rating,
    #comment: _f$comment,
    #date: _f$date,
    #reviewerName: _f$reviewerName,
    #reviewerEmail: _f$reviewerEmail,
  };

  static ProductReview _instantiate(DecodingData data) {
    return ProductReview(
        rating: data.dec(_f$rating),
        comment: data.dec(_f$comment),
        date: data.dec(_f$date),
        reviewerName: data.dec(_f$reviewerName),
        reviewerEmail: data.dec(_f$reviewerEmail));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductReview fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductReview>(map);
  }

  static ProductReview fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductReview>(json);
  }
}

mixin ProductReviewMappable {
  String toJsonString() {
    return ProductReviewMapper.ensureInitialized()
        .encodeJson<ProductReview>(this as ProductReview);
  }

  Map<String, dynamic> toJson() {
    return ProductReviewMapper.ensureInitialized()
        .encodeMap<ProductReview>(this as ProductReview);
  }

  ProductReviewCopyWith<ProductReview, ProductReview, ProductReview>
      get copyWith => _ProductReviewCopyWithImpl(
          this as ProductReview, $identity, $identity);
  @override
  String toString() {
    return ProductReviewMapper.ensureInitialized()
        .stringifyValue(this as ProductReview);
  }

  @override
  bool operator ==(Object other) {
    return ProductReviewMapper.ensureInitialized()
        .equalsValue(this as ProductReview, other);
  }

  @override
  int get hashCode {
    return ProductReviewMapper.ensureInitialized()
        .hashValue(this as ProductReview);
  }
}

extension ProductReviewValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductReview, $Out> {
  ProductReviewCopyWith<$R, ProductReview, $Out> get $asProductReview =>
      $base.as((v, t, t2) => _ProductReviewCopyWithImpl(v, t, t2));
}

abstract class ProductReviewCopyWith<$R, $In extends ProductReview, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? rating,
      String? comment,
      String? date,
      String? reviewerName,
      String? reviewerEmail});
  ProductReviewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductReviewCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductReview, $Out>
    implements ProductReviewCopyWith<$R, ProductReview, $Out> {
  _ProductReviewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductReview> $mapper =
      ProductReviewMapper.ensureInitialized();
  @override
  $R call(
          {int? rating,
          String? comment,
          String? date,
          String? reviewerName,
          String? reviewerEmail}) =>
      $apply(FieldCopyWithData({
        if (rating != null) #rating: rating,
        if (comment != null) #comment: comment,
        if (date != null) #date: date,
        if (reviewerName != null) #reviewerName: reviewerName,
        if (reviewerEmail != null) #reviewerEmail: reviewerEmail
      }));
  @override
  ProductReview $make(CopyWithData data) => ProductReview(
      rating: data.get(#rating, or: $value.rating),
      comment: data.get(#comment, or: $value.comment),
      date: data.get(#date, or: $value.date),
      reviewerName: data.get(#reviewerName, or: $value.reviewerName),
      reviewerEmail: data.get(#reviewerEmail, or: $value.reviewerEmail));

  @override
  ProductReviewCopyWith<$R2, ProductReview, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductReviewCopyWithImpl($value, $cast, t);
}
