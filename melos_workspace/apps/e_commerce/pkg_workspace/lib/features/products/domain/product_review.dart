import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_review.mapper.dart';
part 'product_review.realm.dart';

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

  factory ProductReview.fromRealmObj(ProductReviewRealm obj) =>
      ProductReviewRealmConverter.fromRealmObj(obj);
}

@realmEmbedded
class $ProductReviewRealm {
  late int rating;
  late String comment;
  late String date;
  late String reviewerName;
  late String reviewerEmail;
}

extension ProductReviewRealmConverter on ProductReview {
  static ProductReview fromRealmObj(ProductReviewRealm obj) {
    return ProductReview(
      rating: obj.rating,
      comment: obj.comment,
      date: obj.date,
      reviewerName: obj.reviewerName,
      reviewerEmail: obj.reviewerEmail,
    );
  }

  ProductReviewRealm toRealmObj() {
    return ProductReviewRealm(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }
}
