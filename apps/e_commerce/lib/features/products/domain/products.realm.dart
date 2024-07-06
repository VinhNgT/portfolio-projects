// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductsRealm extends $ProductsRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductsRealm({
    Iterable<ProductRealm> products = const [],
    int? total,
    int? skip,
    int? limit,
  }) {
    RealmObjectBase.set<RealmList<ProductRealm>>(
        this, 'products', RealmList<ProductRealm>(products));
    RealmObjectBase.set(this, 'total', total);
    RealmObjectBase.set(this, 'skip', skip);
    RealmObjectBase.set(this, 'limit', limit);
  }

  ProductsRealm._();

  @override
  RealmList<ProductRealm> get products =>
      RealmObjectBase.get<ProductRealm>(this, 'products')
          as RealmList<ProductRealm>;
  @override
  set products(covariant RealmList<ProductRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  int? get total => RealmObjectBase.get<int>(this, 'total') as int?;
  @override
  set total(int? value) => RealmObjectBase.set(this, 'total', value);

  @override
  int? get skip => RealmObjectBase.get<int>(this, 'skip') as int?;
  @override
  set skip(int? value) => RealmObjectBase.set(this, 'skip', value);

  @override
  int? get limit => RealmObjectBase.get<int>(this, 'limit') as int?;
  @override
  set limit(int? value) => RealmObjectBase.set(this, 'limit', value);

  @override
  Stream<RealmObjectChanges<ProductsRealm>> get changes =>
      RealmObjectBase.getChanges<ProductsRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductsRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductsRealm>(this, keyPaths);

  @override
  ProductsRealm freeze() => RealmObjectBase.freezeObject<ProductsRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'products': products.toEJson(),
      'total': total.toEJson(),
      'skip': skip.toEJson(),
      'limit': limit.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductsRealm value) => value.toEJson();
  static ProductsRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'products': EJsonValue products,
        'total': EJsonValue total,
        'skip': EJsonValue skip,
        'limit': EJsonValue limit,
      } =>
        ProductsRealm(
          products: fromEJson(products),
          total: fromEJson(total),
          skip: fromEJson(skip),
          limit: fromEJson(limit),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductsRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ProductsRealm, 'ProductsRealm', [
      SchemaProperty('products', RealmPropertyType.object,
          linkTarget: 'ProductRealm', collectionType: RealmCollectionType.list),
      SchemaProperty('total', RealmPropertyType.int, optional: true),
      SchemaProperty('skip', RealmPropertyType.int, optional: true),
      SchemaProperty('limit', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
