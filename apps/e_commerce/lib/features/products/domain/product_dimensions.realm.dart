// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dimensions.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductDimensionsRealm extends $ProductDimensionsRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProductDimensionsRealm({
    double? width,
    double? height,
    double? depth,
  }) {
    RealmObjectBase.set(this, 'width', width);
    RealmObjectBase.set(this, 'height', height);
    RealmObjectBase.set(this, 'depth', depth);
  }

  ProductDimensionsRealm._();

  @override
  double? get width => RealmObjectBase.get<double>(this, 'width') as double?;
  @override
  set width(double? value) => RealmObjectBase.set(this, 'width', value);

  @override
  double? get height => RealmObjectBase.get<double>(this, 'height') as double?;
  @override
  set height(double? value) => RealmObjectBase.set(this, 'height', value);

  @override
  double? get depth => RealmObjectBase.get<double>(this, 'depth') as double?;
  @override
  set depth(double? value) => RealmObjectBase.set(this, 'depth', value);

  @override
  Stream<RealmObjectChanges<ProductDimensionsRealm>> get changes =>
      RealmObjectBase.getChanges<ProductDimensionsRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductDimensionsRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductDimensionsRealm>(this, keyPaths);

  @override
  ProductDimensionsRealm freeze() =>
      RealmObjectBase.freezeObject<ProductDimensionsRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'width': width.toEJson(),
      'height': height.toEJson(),
      'depth': depth.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductDimensionsRealm value) => value.toEJson();
  static ProductDimensionsRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'width': EJsonValue width,
        'height': EJsonValue height,
        'depth': EJsonValue depth,
      } =>
        ProductDimensionsRealm(
          width: fromEJson(width),
          height: fromEJson(height),
          depth: fromEJson(depth),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductDimensionsRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, ProductDimensionsRealm,
        'ProductDimensionsRealm', [
      SchemaProperty('width', RealmPropertyType.double, optional: true),
      SchemaProperty('height', RealmPropertyType.double, optional: true),
      SchemaProperty('depth', RealmPropertyType.double, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
