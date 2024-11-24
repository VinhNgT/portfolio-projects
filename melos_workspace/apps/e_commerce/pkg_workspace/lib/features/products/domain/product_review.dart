import 'package:dart_mappable/dart_mappable.dart';

part 'product_review.mapper.dart';

@MappableClass()
class ProductReview with ProductReviewMappable {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ProductReview({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      ProductReviewMapper.fromJson(json);
}
