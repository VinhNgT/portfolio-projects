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
    Iterable<ProductVariantRealm> selectedVariants = const [],
    required int quantity,
    required bool isChecked,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'product', product);
    RealmObjectBase.set<RealmList<ProductVariantRealm>>(this,
        'selectedVariants', RealmList<ProductVariantRealm>(selectedVariants));
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'isChecked', isChecked);
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
  RealmList<ProductVariantRealm> get selectedVariants =>
      RealmObjectBase.get<ProductVariantRealm>(this, 'selectedVariants')
          as RealmList<ProductVariantRealm>;
  @override
  set selectedVariants(covariant RealmList<ProductVariantRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  bool get isChecked => RealmObjectBase.get<bool>(this, 'isChecked') as bool;
  @override
  set isChecked(bool value) => RealmObjectBase.set(this, 'isChecked', value);

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
      'isChecked': isChecked.toEJson(),
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
        'isChecked': EJsonValue isChecked,
      } =>
        CartItemRealm(
          id: fromEJson(id),
          product: fromEJson(product),
          selectedVariants: fromEJson(selectedVariants),
          quantity: fromEJson(quantity),
          isChecked: fromEJson(isChecked),
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
          collectionType: RealmCollectionType.list),
      SchemaProperty('quantity', RealmPropertyType.int),
      SchemaProperty('isChecked', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
