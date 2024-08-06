// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CartItemRealm extends $CartItemRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  CartItemRealm({
    required Uuid id,
    OrderItemRealm? orderItem,
    required bool isIncludeInOrder,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'orderItem', orderItem);
    RealmObjectBase.set(this, 'isIncludeInOrder', isIncludeInOrder);
  }

  CartItemRealm._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  OrderItemRealm? get orderItem =>
      RealmObjectBase.get<OrderItemRealm>(this, 'orderItem') as OrderItemRealm?;
  @override
  set orderItem(covariant OrderItemRealm? value) =>
      RealmObjectBase.set(this, 'orderItem', value);

  @override
  bool get isIncludeInOrder =>
      RealmObjectBase.get<bool>(this, 'isIncludeInOrder') as bool;
  @override
  set isIncludeInOrder(bool value) =>
      RealmObjectBase.set(this, 'isIncludeInOrder', value);

  @override
  Stream<RealmObjectChanges<CartItemRealm>> get changes =>
      RealmObjectBase.getChanges<CartItemRealm>(this);

  @override
  Stream<RealmObjectChanges<CartItemRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CartItemRealm>(this, keyPaths);

  @override
  CartItemRealm freeze() => RealmObjectBase.freezeObject<CartItemRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'orderItem': orderItem.toEJson(),
      'isIncludeInOrder': isIncludeInOrder.toEJson(),
    };
  }

  static EJsonValue _toEJson(CartItemRealm value) => value.toEJson();
  static CartItemRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'orderItem': EJsonValue orderItem,
        'isIncludeInOrder': EJsonValue isIncludeInOrder,
      } =>
        CartItemRealm(
          id: fromEJson(id),
          orderItem: fromEJson(orderItem),
          isIncludeInOrder: fromEJson(isIncludeInOrder),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CartItemRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, CartItemRealm, 'CartItemRealm', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('orderItem', RealmPropertyType.object,
          optional: true, linkTarget: 'OrderItemRealm'),
      SchemaProperty('isIncludeInOrder', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
