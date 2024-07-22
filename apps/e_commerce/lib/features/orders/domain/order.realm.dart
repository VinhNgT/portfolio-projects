// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class OrderRealm extends $OrderRealm
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  OrderRealm({
    Iterable<CartItemRealm> items = const [],
    required double orderDiscount,
  }) {
    RealmObjectBase.set<RealmList<CartItemRealm>>(
        this, 'items', RealmList<CartItemRealm>(items));
    RealmObjectBase.set(this, 'orderDiscount', orderDiscount);
  }

  OrderRealm._();

  @override
  RealmList<CartItemRealm> get items =>
      RealmObjectBase.get<CartItemRealm>(this, 'items')
          as RealmList<CartItemRealm>;
  @override
  set items(covariant RealmList<CartItemRealm> value) =>
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
          linkTarget: 'CartItemRealm',
          collectionType: RealmCollectionType.list),
      SchemaProperty('orderDiscount', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
