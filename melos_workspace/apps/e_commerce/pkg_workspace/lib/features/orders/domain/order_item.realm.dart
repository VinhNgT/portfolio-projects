// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class OrderItemRealm extends $OrderItemRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  OrderItemRealm({
    required Uuid id,
    ProductRealm? product,
    Map<String, String?> variantSelection = const {},
    required int quantity,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'product', product);
    RealmObjectBase.set<RealmMap<String?>>(
        this, 'variantSelection', RealmMap<String?>(variantSelection));
    RealmObjectBase.set(this, 'quantity', quantity);
  }

  OrderItemRealm._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  ProductRealm? get product =>
      RealmObjectBase.get<ProductRealm>(this, 'product') as ProductRealm?;
  @override
  set product(covariant ProductRealm? value) =>
      RealmObjectBase.set(this, 'product', value);

  @override
  RealmMap<String?> get variantSelection =>
      RealmObjectBase.get<String?>(this, 'variantSelection')
          as RealmMap<String?>;
  @override
  set variantSelection(covariant RealmMap<String?> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  Stream<RealmObjectChanges<OrderItemRealm>> get changes =>
      RealmObjectBase.getChanges<OrderItemRealm>(this);

  @override
  Stream<RealmObjectChanges<OrderItemRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<OrderItemRealm>(this, keyPaths);

  @override
  OrderItemRealm freeze() => RealmObjectBase.freezeObject<OrderItemRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'product': product.toEJson(),
      'variantSelection': variantSelection.toEJson(),
      'quantity': quantity.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderItemRealm value) => value.toEJson();
  static OrderItemRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'product': EJsonValue product,
        'variantSelection': EJsonValue variantSelection,
        'quantity': EJsonValue quantity,
      } =>
        OrderItemRealm(
          id: fromEJson(id),
          product: fromEJson(product),
          variantSelection: fromEJson(variantSelection),
          quantity: fromEJson(quantity),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderItemRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, OrderItemRealm, 'OrderItemRealm', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('product', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductRealm'),
      SchemaProperty('variantSelection', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.map),
      SchemaProperty('quantity', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
