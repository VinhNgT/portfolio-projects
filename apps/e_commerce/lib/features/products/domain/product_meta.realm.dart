// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductMetaRealm extends $ProductMetaRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProductMetaRealm({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'qrCode', qrCode);
  }

  ProductMetaRealm._();

  @override
  DateTime? get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime?;
  @override
  set createdAt(DateTime? value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime? get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime?;
  @override
  set updatedAt(DateTime? value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String? get barcode =>
      RealmObjectBase.get<String>(this, 'barcode') as String?;
  @override
  set barcode(String? value) => RealmObjectBase.set(this, 'barcode', value);

  @override
  String? get qrCode => RealmObjectBase.get<String>(this, 'qrCode') as String?;
  @override
  set qrCode(String? value) => RealmObjectBase.set(this, 'qrCode', value);

  @override
  Stream<RealmObjectChanges<ProductMetaRealm>> get changes =>
      RealmObjectBase.getChanges<ProductMetaRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductMetaRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductMetaRealm>(this, keyPaths);

  @override
  ProductMetaRealm freeze() =>
      RealmObjectBase.freezeObject<ProductMetaRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'createdAt': createdAt.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'barcode': barcode.toEJson(),
      'qrCode': qrCode.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductMetaRealm value) => value.toEJson();
  static ProductMetaRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'createdAt': EJsonValue createdAt,
        'updatedAt': EJsonValue updatedAt,
        'barcode': EJsonValue barcode,
        'qrCode': EJsonValue qrCode,
      } =>
        ProductMetaRealm(
          createdAt: fromEJson(createdAt),
          updatedAt: fromEJson(updatedAt),
          barcode: fromEJson(barcode),
          qrCode: fromEJson(qrCode),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductMetaRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.embeddedObject, ProductMetaRealm, 'ProductMetaRealm', [
      SchemaProperty('createdAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('barcode', RealmPropertyType.string, optional: true),
      SchemaProperty('qrCode', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
