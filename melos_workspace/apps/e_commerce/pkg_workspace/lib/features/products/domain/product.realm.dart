// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductRealm extends $ProductRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductRealm({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    Iterable<String> tags = const [],
    String? brand,
    required String sku,
    required int weight,
    ProductDimensionsRealm? dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    Iterable<ProductReviewRealm> reviews = const [],
    required String returnPolicy,
    required int minimumOrderQuantity,
    ProductMetaRealm? meta,
    required String thumbnail,
    Iterable<String> images = const [],
    Iterable<ProductVariantGroupRealm> variantGroups = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'discountPercentage', discountPercentage);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'stock', stock);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set(this, 'brand', brand);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'weight', weight);
    RealmObjectBase.set(this, 'dimensions', dimensions);
    RealmObjectBase.set(this, 'warrantyInformation', warrantyInformation);
    RealmObjectBase.set(this, 'shippingInformation', shippingInformation);
    RealmObjectBase.set(this, 'availabilityStatus', availabilityStatus);
    RealmObjectBase.set<RealmList<ProductReviewRealm>>(
        this, 'reviews', RealmList<ProductReviewRealm>(reviews));
    RealmObjectBase.set(this, 'returnPolicy', returnPolicy);
    RealmObjectBase.set(this, 'minimumOrderQuantity', minimumOrderQuantity);
    RealmObjectBase.set(this, 'meta', meta);
    RealmObjectBase.set(this, 'thumbnail', thumbnail);
    RealmObjectBase.set<RealmList<String>>(
        this, 'images', RealmList<String>(images));
    RealmObjectBase.set<RealmList<ProductVariantGroupRealm>>(this,
        'variantGroups', RealmList<ProductVariantGroupRealm>(variantGroups));
  }

  ProductRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  double get discountPercentage =>
      RealmObjectBase.get<double>(this, 'discountPercentage') as double;
  @override
  set discountPercentage(double value) =>
      RealmObjectBase.set(this, 'discountPercentage', value);

  @override
  double get rating => RealmObjectBase.get<double>(this, 'rating') as double;
  @override
  set rating(double value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int get stock => RealmObjectBase.get<int>(this, 'stock') as int;
  @override
  set stock(int value) => RealmObjectBase.set(this, 'stock', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get brand => RealmObjectBase.get<String>(this, 'brand') as String?;
  @override
  set brand(String? value) => RealmObjectBase.set(this, 'brand', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;
  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  int get weight => RealmObjectBase.get<int>(this, 'weight') as int;
  @override
  set weight(int value) => RealmObjectBase.set(this, 'weight', value);

  @override
  ProductDimensionsRealm? get dimensions =>
      RealmObjectBase.get<ProductDimensionsRealm>(this, 'dimensions')
          as ProductDimensionsRealm?;
  @override
  set dimensions(covariant ProductDimensionsRealm? value) =>
      RealmObjectBase.set(this, 'dimensions', value);

  @override
  String get warrantyInformation =>
      RealmObjectBase.get<String>(this, 'warrantyInformation') as String;
  @override
  set warrantyInformation(String value) =>
      RealmObjectBase.set(this, 'warrantyInformation', value);

  @override
  String get shippingInformation =>
      RealmObjectBase.get<String>(this, 'shippingInformation') as String;
  @override
  set shippingInformation(String value) =>
      RealmObjectBase.set(this, 'shippingInformation', value);

  @override
  String get availabilityStatus =>
      RealmObjectBase.get<String>(this, 'availabilityStatus') as String;
  @override
  set availabilityStatus(String value) =>
      RealmObjectBase.set(this, 'availabilityStatus', value);

  @override
  RealmList<ProductReviewRealm> get reviews =>
      RealmObjectBase.get<ProductReviewRealm>(this, 'reviews')
          as RealmList<ProductReviewRealm>;
  @override
  set reviews(covariant RealmList<ProductReviewRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get returnPolicy =>
      RealmObjectBase.get<String>(this, 'returnPolicy') as String;
  @override
  set returnPolicy(String value) =>
      RealmObjectBase.set(this, 'returnPolicy', value);

  @override
  int get minimumOrderQuantity =>
      RealmObjectBase.get<int>(this, 'minimumOrderQuantity') as int;
  @override
  set minimumOrderQuantity(int value) =>
      RealmObjectBase.set(this, 'minimumOrderQuantity', value);

  @override
  ProductMetaRealm? get meta =>
      RealmObjectBase.get<ProductMetaRealm>(this, 'meta') as ProductMetaRealm?;
  @override
  set meta(covariant ProductMetaRealm? value) =>
      RealmObjectBase.set(this, 'meta', value);

  @override
  String get thumbnail =>
      RealmObjectBase.get<String>(this, 'thumbnail') as String;
  @override
  set thumbnail(String value) => RealmObjectBase.set(this, 'thumbnail', value);

  @override
  RealmList<String> get images =>
      RealmObjectBase.get<String>(this, 'images') as RealmList<String>;
  @override
  set images(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ProductVariantGroupRealm> get variantGroups =>
      RealmObjectBase.get<ProductVariantGroupRealm>(this, 'variantGroups')
          as RealmList<ProductVariantGroupRealm>;
  @override
  set variantGroups(covariant RealmList<ProductVariantGroupRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ProductRealm>> get changes =>
      RealmObjectBase.getChanges<ProductRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductRealm>(this, keyPaths);

  @override
  ProductRealm freeze() => RealmObjectBase.freezeObject<ProductRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'description': description.toEJson(),
      'category': category.toEJson(),
      'price': price.toEJson(),
      'discountPercentage': discountPercentage.toEJson(),
      'rating': rating.toEJson(),
      'stock': stock.toEJson(),
      'tags': tags.toEJson(),
      'brand': brand.toEJson(),
      'sku': sku.toEJson(),
      'weight': weight.toEJson(),
      'dimensions': dimensions.toEJson(),
      'warrantyInformation': warrantyInformation.toEJson(),
      'shippingInformation': shippingInformation.toEJson(),
      'availabilityStatus': availabilityStatus.toEJson(),
      'reviews': reviews.toEJson(),
      'returnPolicy': returnPolicy.toEJson(),
      'minimumOrderQuantity': minimumOrderQuantity.toEJson(),
      'meta': meta.toEJson(),
      'thumbnail': thumbnail.toEJson(),
      'images': images.toEJson(),
      'variantGroups': variantGroups.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductRealm value) => value.toEJson();
  static ProductRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'description': EJsonValue description,
        'category': EJsonValue category,
        'price': EJsonValue price,
        'discountPercentage': EJsonValue discountPercentage,
        'rating': EJsonValue rating,
        'stock': EJsonValue stock,
        'tags': EJsonValue tags,
        'brand': EJsonValue brand,
        'sku': EJsonValue sku,
        'weight': EJsonValue weight,
        'dimensions': EJsonValue dimensions,
        'warrantyInformation': EJsonValue warrantyInformation,
        'shippingInformation': EJsonValue shippingInformation,
        'availabilityStatus': EJsonValue availabilityStatus,
        'reviews': EJsonValue reviews,
        'returnPolicy': EJsonValue returnPolicy,
        'minimumOrderQuantity': EJsonValue minimumOrderQuantity,
        'meta': EJsonValue meta,
        'thumbnail': EJsonValue thumbnail,
        'images': EJsonValue images,
        'variantGroups': EJsonValue variantGroups,
      } =>
        ProductRealm(
          id: fromEJson(id),
          title: fromEJson(title),
          description: fromEJson(description),
          category: fromEJson(category),
          price: fromEJson(price),
          discountPercentage: fromEJson(discountPercentage),
          rating: fromEJson(rating),
          stock: fromEJson(stock),
          tags: fromEJson(tags),
          brand: fromEJson(brand),
          sku: fromEJson(sku),
          weight: fromEJson(weight),
          dimensions: fromEJson(dimensions),
          warrantyInformation: fromEJson(warrantyInformation),
          shippingInformation: fromEJson(shippingInformation),
          availabilityStatus: fromEJson(availabilityStatus),
          reviews: fromEJson(reviews),
          returnPolicy: fromEJson(returnPolicy),
          minimumOrderQuantity: fromEJson(minimumOrderQuantity),
          meta: fromEJson(meta),
          thumbnail: fromEJson(thumbnail),
          images: fromEJson(images),
          variantGroups: fromEJson(variantGroups),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ProductRealm, 'ProductRealm', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('discountPercentage', RealmPropertyType.double),
      SchemaProperty('rating', RealmPropertyType.double),
      SchemaProperty('stock', RealmPropertyType.int),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('brand', RealmPropertyType.string, optional: true),
      SchemaProperty('sku', RealmPropertyType.string),
      SchemaProperty('weight', RealmPropertyType.int),
      SchemaProperty('dimensions', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductDimensionsRealm'),
      SchemaProperty('warrantyInformation', RealmPropertyType.string),
      SchemaProperty('shippingInformation', RealmPropertyType.string),
      SchemaProperty('availabilityStatus', RealmPropertyType.string),
      SchemaProperty('reviews', RealmPropertyType.object,
          linkTarget: 'ProductReviewRealm',
          collectionType: RealmCollectionType.list),
      SchemaProperty('returnPolicy', RealmPropertyType.string),
      SchemaProperty('minimumOrderQuantity', RealmPropertyType.int),
      SchemaProperty('meta', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductMetaRealm'),
      SchemaProperty('thumbnail', RealmPropertyType.string),
      SchemaProperty('images', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('variantGroups', RealmPropertyType.object,
          linkTarget: 'ProductVariantGroupRealm',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
