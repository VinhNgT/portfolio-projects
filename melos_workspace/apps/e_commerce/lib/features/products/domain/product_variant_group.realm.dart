// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_group.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductVariantGroupRealm extends $ProductVariantGroupRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductVariantGroupRealm({
    required Uuid id,
    required String groupName,
    Iterable<ProductVariantRealm> variants = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'groupName', groupName);
    RealmObjectBase.set<RealmList<ProductVariantRealm>>(
        this, 'variants', RealmList<ProductVariantRealm>(variants));
  }

  ProductVariantGroupRealm._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get groupName =>
      RealmObjectBase.get<String>(this, 'groupName') as String;
  @override
  set groupName(String value) => RealmObjectBase.set(this, 'groupName', value);

  @override
  RealmList<ProductVariantRealm> get variants =>
      RealmObjectBase.get<ProductVariantRealm>(this, 'variants')
          as RealmList<ProductVariantRealm>;
  @override
  set variants(covariant RealmList<ProductVariantRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ProductVariantGroupRealm>> get changes =>
      RealmObjectBase.getChanges<ProductVariantGroupRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductVariantGroupRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductVariantGroupRealm>(this, keyPaths);

  @override
  ProductVariantGroupRealm freeze() =>
      RealmObjectBase.freezeObject<ProductVariantGroupRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'groupName': groupName.toEJson(),
      'variants': variants.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductVariantGroupRealm value) => value.toEJson();
  static ProductVariantGroupRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'groupName': EJsonValue groupName,
        'variants': EJsonValue variants,
      } =>
        ProductVariantGroupRealm(
          id: fromEJson(id),
          groupName: fromEJson(groupName),
          variants: fromEJson(variants),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductVariantGroupRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ProductVariantGroupRealm,
        'ProductVariantGroupRealm', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('groupName', RealmPropertyType.string),
      SchemaProperty('variants', RealmPropertyType.object,
          linkTarget: 'ProductVariantRealm',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
