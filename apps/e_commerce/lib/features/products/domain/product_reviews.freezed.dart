// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_reviews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReviews _$ProductReviewsFromJson(Map<String, dynamic> json) {
  return _ProductReviews.fromJson(json);
}

/// @nodoc
mixin _$ProductReviews {
  int? get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get reviewerName => throw _privateConstructorUsedError;
  String? get reviewerEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReviewsCopyWith<ProductReviews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewsCopyWith<$Res> {
  factory $ProductReviewsCopyWith(
          ProductReviews value, $Res Function(ProductReviews) then) =
      _$ProductReviewsCopyWithImpl<$Res, ProductReviews>;
  @useResult
  $Res call(
      {int? rating,
      String? comment,
      String? date,
      String? reviewerName,
      String? reviewerEmail});
}

/// @nodoc
class _$ProductReviewsCopyWithImpl<$Res, $Val extends ProductReviews>
    implements $ProductReviewsCopyWith<$Res> {
  _$ProductReviewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = freezed,
    Object? date = freezed,
    Object? reviewerName = freezed,
    Object? reviewerEmail = freezed,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewerName: freezed == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewerEmail: freezed == reviewerEmail
          ? _value.reviewerEmail
          : reviewerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReviewsImplCopyWith<$Res>
    implements $ProductReviewsCopyWith<$Res> {
  factory _$$ProductReviewsImplCopyWith(_$ProductReviewsImpl value,
          $Res Function(_$ProductReviewsImpl) then) =
      __$$ProductReviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? rating,
      String? comment,
      String? date,
      String? reviewerName,
      String? reviewerEmail});
}

/// @nodoc
class __$$ProductReviewsImplCopyWithImpl<$Res>
    extends _$ProductReviewsCopyWithImpl<$Res, _$ProductReviewsImpl>
    implements _$$ProductReviewsImplCopyWith<$Res> {
  __$$ProductReviewsImplCopyWithImpl(
      _$ProductReviewsImpl _value, $Res Function(_$ProductReviewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = freezed,
    Object? date = freezed,
    Object? reviewerName = freezed,
    Object? reviewerEmail = freezed,
  }) {
    return _then(_$ProductReviewsImpl(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewerName: freezed == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewerEmail: freezed == reviewerEmail
          ? _value.reviewerEmail
          : reviewerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReviewsImpl implements _ProductReviews {
  const _$ProductReviewsImpl(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory _$ProductReviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewsImplFromJson(json);

  @override
  final int? rating;
  @override
  final String? comment;
  @override
  final String? date;
  @override
  final String? reviewerName;
  @override
  final String? reviewerEmail;

  @override
  String toString() {
    return 'ProductReviews(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewsImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.reviewerEmail, reviewerEmail) ||
                other.reviewerEmail == reviewerEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rating, comment, date, reviewerName, reviewerEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewsImplCopyWith<_$ProductReviewsImpl> get copyWith =>
      __$$ProductReviewsImplCopyWithImpl<_$ProductReviewsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewsImplToJson(
      this,
    );
  }
}

abstract class _ProductReviews implements ProductReviews {
  const factory _ProductReviews(
      {final int? rating,
      final String? comment,
      final String? date,
      final String? reviewerName,
      final String? reviewerEmail}) = _$ProductReviewsImpl;

  factory _ProductReviews.fromJson(Map<String, dynamic> json) =
      _$ProductReviewsImpl.fromJson;

  @override
  int? get rating;
  @override
  String? get comment;
  @override
  String? get date;
  @override
  String? get reviewerName;
  @override
  String? get reviewerEmail;
  @override
  @JsonKey(ignore: true)
  _$$ProductReviewsImplCopyWith<_$ProductReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
