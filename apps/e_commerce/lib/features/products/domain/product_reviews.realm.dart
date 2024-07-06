// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductReviewsRealm extends $ProductReviewsRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProductReviewsRealm({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'reviewerName', reviewerName);
    RealmObjectBase.set(this, 'reviewerEmail', reviewerEmail);
  }

  ProductReviewsRealm._();

  @override
  int? get rating => RealmObjectBase.get<int>(this, 'rating') as int?;
  @override
  set rating(int? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  String? get comment =>
      RealmObjectBase.get<String>(this, 'comment') as String?;
  @override
  set comment(String? value) => RealmObjectBase.set(this, 'comment', value);

  @override
  String? get date => RealmObjectBase.get<String>(this, 'date') as String?;
  @override
  set date(String? value) => RealmObjectBase.set(this, 'date', value);

  @override
  String? get reviewerName =>
      RealmObjectBase.get<String>(this, 'reviewerName') as String?;
  @override
  set reviewerName(String? value) =>
      RealmObjectBase.set(this, 'reviewerName', value);

  @override
  String? get reviewerEmail =>
      RealmObjectBase.get<String>(this, 'reviewerEmail') as String?;
  @override
  set reviewerEmail(String? value) =>
      RealmObjectBase.set(this, 'reviewerEmail', value);

  @override
  Stream<RealmObjectChanges<ProductReviewsRealm>> get changes =>
      RealmObjectBase.getChanges<ProductReviewsRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductReviewsRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductReviewsRealm>(this, keyPaths);

  @override
  ProductReviewsRealm freeze() =>
      RealmObjectBase.freezeObject<ProductReviewsRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'rating': rating.toEJson(),
      'comment': comment.toEJson(),
      'date': date.toEJson(),
      'reviewerName': reviewerName.toEJson(),
      'reviewerEmail': reviewerEmail.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductReviewsRealm value) => value.toEJson();
  static ProductReviewsRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'rating': EJsonValue rating,
        'comment': EJsonValue comment,
        'date': EJsonValue date,
        'reviewerName': EJsonValue reviewerName,
        'reviewerEmail': EJsonValue reviewerEmail,
      } =>
        ProductReviewsRealm(
          rating: fromEJson(rating),
          comment: fromEJson(comment),
          date: fromEJson(date),
          reviewerName: fromEJson(reviewerName),
          reviewerEmail: fromEJson(reviewerEmail),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductReviewsRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.embeddedObject, ProductReviewsRealm, 'ProductReviewsRealm', [
      SchemaProperty('rating', RealmPropertyType.int, optional: true),
      SchemaProperty('comment', RealmPropertyType.string, optional: true),
      SchemaProperty('date', RealmPropertyType.string, optional: true),
      SchemaProperty('reviewerName', RealmPropertyType.string, optional: true),
      SchemaProperty('reviewerEmail', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
