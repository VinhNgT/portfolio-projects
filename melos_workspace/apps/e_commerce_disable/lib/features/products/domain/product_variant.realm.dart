// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductVariantRealm extends $ProductVariantRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductVariantRealm({
    required Uuid id,
    required String name,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  ProductVariantRealm._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<ProductVariantRealm>> get changes =>
      RealmObjectBase.getChanges<ProductVariantRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductVariantRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductVariantRealm>(this, keyPaths);

  @override
  ProductVariantRealm freeze() =>
      RealmObjectBase.freezeObject<ProductVariantRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductVariantRealm value) => value.toEJson();
  static ProductVariantRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        ProductVariantRealm(
          id: fromEJson(id),
          name: fromEJson(name),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductVariantRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, ProductVariantRealm, 'ProductVariantRealm', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
