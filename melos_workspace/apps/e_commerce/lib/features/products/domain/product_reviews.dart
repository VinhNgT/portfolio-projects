import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_reviews.mapper.dart';
part 'product_reviews.realm.dart';

@MappableClass()
class ProductReviews with ProductReviewsMappable {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ProductReviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductReviews.fromRealmObj(ProductReviewsRealm obj) =>
      ProductReviewsRealmConverter.fromRealmObj(obj);
}

@realmEmbedded
class $ProductReviewsRealm {
  late int rating;
  late String comment;
  late String date;
  late String reviewerName;
  late String reviewerEmail;
}

extension ProductReviewsRealmConverter on ProductReviews {
  static ProductReviews fromRealmObj(ProductReviewsRealm obj) {
    return ProductReviews(
      rating: obj.rating,
      comment: obj.comment,
      date: obj.date,
      reviewerName: obj.reviewerName,
      reviewerEmail: obj.reviewerEmail,
    );
  }

  ProductReviewsRealm toRealmObj() {
    return ProductReviewsRealm(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }
}
