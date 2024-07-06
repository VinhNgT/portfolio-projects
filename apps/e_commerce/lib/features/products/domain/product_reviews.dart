import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_reviews.mapper.dart';
part 'product_reviews.realm.dart';

@MappableClass()
class ProductReviews with ProductReviewsMappable {
  const ProductReviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductReviews.fromRealm(ProductReviewsRealm realm) {
    return ProductReviews(
      rating: realm.rating,
      comment: realm.comment,
      date: realm.date,
      reviewerName: realm.reviewerName,
      reviewerEmail: realm.reviewerEmail,
    );
  }

  ProductReviewsRealm toRealm() {
    return ProductReviewsRealm(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }

  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;
}

@realmEmbedded
class $ProductReviewsRealm {
  late int? rating;
  late String? comment;
  late String? date;
  late String? reviewerName;
  late String? reviewerEmail;
}
