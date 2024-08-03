// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CartRealm extends $CartRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  CartRealm({
    required Uuid id,
    Iterable<CartItemRealm> cartItems = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set<RealmList<CartItemRealm>>(
        this, 'cartItems', RealmList<CartItemRealm>(cartItems));
  }

  CartRealm._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  RealmList<CartItemRealm> get cartItems =>
      RealmObjectBase.get<CartItemRealm>(this, 'cartItems')
          as RealmList<CartItemRealm>;
  @override
  set cartItems(covariant RealmList<CartItemRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CartRealm>> get changes =>
      RealmObjectBase.getChanges<CartRealm>(this);

  @override
  Stream<RealmObjectChanges<CartRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CartRealm>(this, keyPaths);

  @override
  CartRealm freeze() => RealmObjectBase.freezeObject<CartRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'cartItems': cartItems.toEJson(),
    };
  }

  static EJsonValue _toEJson(CartRealm value) => value.toEJson();
  static CartRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'cartItems': EJsonValue cartItems,
      } =>
        CartRealm(
          id: fromEJson(id),
          cartItems: fromEJson(cartItems),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CartRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, CartRealm, 'CartRealm', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('cartItems', RealmPropertyType.object,
          linkTarget: 'CartItemRealm',
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
