// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductReviewRealm extends $ProductReviewRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProductReviewRealm({
    required int rating,
    required String comment,
    required String date,
    required String reviewerName,
    required String reviewerEmail,
  }) {
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'reviewerName', reviewerName);
    RealmObjectBase.set(this, 'reviewerEmail', reviewerEmail);
  }

  ProductReviewRealm._();

  @override
  int get rating => RealmObjectBase.get<int>(this, 'rating') as int;
  @override
  set rating(int value) => RealmObjectBase.set(this, 'rating', value);

  @override
  String get comment => RealmObjectBase.get<String>(this, 'comment') as String;
  @override
  set comment(String value) => RealmObjectBase.set(this, 'comment', value);

  @override
  String get date => RealmObjectBase.get<String>(this, 'date') as String;
  @override
  set date(String value) => RealmObjectBase.set(this, 'date', value);

  @override
  String get reviewerName =>
      RealmObjectBase.get<String>(this, 'reviewerName') as String;
  @override
  set reviewerName(String value) =>
      RealmObjectBase.set(this, 'reviewerName', value);

  @override
  String get reviewerEmail =>
      RealmObjectBase.get<String>(this, 'reviewerEmail') as String;
  @override
  set reviewerEmail(String value) =>
      RealmObjectBase.set(this, 'reviewerEmail', value);

  @override
  Stream<RealmObjectChanges<ProductReviewRealm>> get changes =>
      RealmObjectBase.getChanges<ProductReviewRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductReviewRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductReviewRealm>(this, keyPaths);

  @override
  ProductReviewRealm freeze() =>
      RealmObjectBase.freezeObject<ProductReviewRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'rating': rating.toEJson(),
      'comment': comment.toEJson(),
      'date': date.toEJson(),
      'reviewerName': reviewerName.toEJson(),
      'reviewerEmail': reviewerEmail.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductReviewRealm value) => value.toEJson();
  static ProductReviewRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'rating': EJsonValue rating,
        'comment': EJsonValue comment,
        'date': EJsonValue date,
        'reviewerName': EJsonValue reviewerName,
        'reviewerEmail': EJsonValue reviewerEmail,
      } =>
        ProductReviewRealm(
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
    RealmObjectBase.registerFactory(ProductReviewRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.embeddedObject, ProductReviewRealm, 'ProductReviewRealm', [
      SchemaProperty('rating', RealmPropertyType.int),
      SchemaProperty('comment', RealmPropertyType.string),
      SchemaProperty('date', RealmPropertyType.string),
      SchemaProperty('reviewerName', RealmPropertyType.string),
      SchemaProperty('reviewerEmail', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
