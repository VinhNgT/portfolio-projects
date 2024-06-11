import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_reviews.freezed.dart';
part 'product_reviews.g.dart';

@freezed
class ProductReviews with _$ProductReviews {
  const factory ProductReviews({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) = _ProductReviews;

  factory ProductReviews.fromJson(Map<String, Object?> json) =>
      _$ProductReviewsFromJson(json);
}
