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
    ProductRealm? product,
    Set<ProductVariantRealm> selectedVariants = const {},
    required int quantity,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'product', product);
    RealmObjectBase.set<RealmSet<ProductVariantRealm>>(this, 'selectedVariants',
        RealmSet<ProductVariantRealm>(selectedVariants));
    RealmObjectBase.set(this, 'quantity', quantity);
  }

  CartItemRealm._();

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
  RealmSet<ProductVariantRealm> get selectedVariants =>
      RealmObjectBase.get<ProductVariantRealm>(this, 'selectedVariants')
          as RealmSet<ProductVariantRealm>;
  @override
  set selectedVariants(covariant RealmSet<ProductVariantRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

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
      'product': product.toEJson(),
      'selectedVariants': selectedVariants.toEJson(),
      'quantity': quantity.toEJson(),
    };
  }

  static EJsonValue _toEJson(CartItemRealm value) => value.toEJson();
  static CartItemRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'product': EJsonValue product,
        'selectedVariants': EJsonValue selectedVariants,
        'quantity': EJsonValue quantity,
      } =>
        CartItemRealm(
          id: fromEJson(id),
          product: fromEJson(product),
          selectedVariants: fromEJson(selectedVariants),
          quantity: fromEJson(quantity),
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
      SchemaProperty('product', RealmPropertyType.object,
          optional: true, linkTarget: 'ProductRealm'),
      SchemaProperty('selectedVariants', RealmPropertyType.object,
          linkTarget: 'ProductVariantRealm',
          collectionType: RealmCollectionType.set),
      SchemaProperty('quantity', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
