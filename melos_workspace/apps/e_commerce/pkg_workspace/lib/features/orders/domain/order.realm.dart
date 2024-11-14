// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class OrderRealm extends $OrderRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  OrderRealm({
    Iterable<OrderItemRealm> items = const [],
    required double orderDiscount,
  }) {
    RealmObjectBase.set<RealmList<OrderItemRealm>>(
        this, 'items', RealmList<OrderItemRealm>(items));
    RealmObjectBase.set(this, 'orderDiscount', orderDiscount);
  }

  OrderRealm._();

  @override
  RealmList<OrderItemRealm> get items =>
      RealmObjectBase.get<OrderItemRealm>(this, 'items')
          as RealmList<OrderItemRealm>;
  @override
  set items(covariant RealmList<OrderItemRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get orderDiscount =>
      RealmObjectBase.get<double>(this, 'orderDiscount') as double;
  @override
  set orderDiscount(double value) =>
      RealmObjectBase.set(this, 'orderDiscount', value);

  @override
  Stream<RealmObjectChanges<OrderRealm>> get changes =>
      RealmObjectBase.getChanges<OrderRealm>(this);

  @override
  Stream<RealmObjectChanges<OrderRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<OrderRealm>(this, keyPaths);

  @override
  OrderRealm freeze() => RealmObjectBase.freezeObject<OrderRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'items': items.toEJson(),
      'orderDiscount': orderDiscount.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderRealm value) => value.toEJson();
  static OrderRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'items': EJsonValue items,
        'orderDiscount': EJsonValue orderDiscount,
      } =>
        OrderRealm(
          items: fromEJson(items),
          orderDiscount: fromEJson(orderDiscount),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, OrderRealm, 'OrderRealm', [
      SchemaProperty('items', RealmPropertyType.object,
          linkTarget: 'OrderItemRealm',
          collectionType: RealmCollectionType.list),
      SchemaProperty('orderDiscount', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
