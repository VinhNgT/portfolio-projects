// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewsImpl _$$ProductReviewsImplFromJson(Map<String, dynamic> json) =>
    _$ProductReviewsImpl(
      rating: (json['rating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      date: json['date'] as String?,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
    );

Map<String, dynamic> _$$ProductReviewsImplToJson(
        _$ProductReviewsImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
