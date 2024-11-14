// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart.dart';

class CartMapper extends ClassMapperBase<Cart> {
  CartMapper._();

  static CartMapper? _instance;
  static CartMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartMapper._());
      CartItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Cart';

  static Uuid _$id(Cart v) => v.id;
  static const Field<Cart, Uuid> _f$id = Field('id', _$id);
  static List<CartItem> _$cartItems(Cart v) => v.cartItems;
  static const Field<Cart, List<CartItem>> _f$cartItems =
      Field('cartItems', _$cartItems);

  @override
  final MappableFields<Cart> fields = const {
    #id: _f$id,
    #cartItems: _f$cartItems,
  };

  static Cart _instantiate(DecodingData data) {
    return Cart(id: data.dec(_f$id), cartItems: data.dec(_f$cartItems));
  }

  @override
  final Function instantiate = _instantiate;

  static Cart fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Cart>(map);
  }

  static Cart fromJsonString(String json) {
    return ensureInitialized().decodeJson<Cart>(json);
  }
}

mixin CartMappable {
  String toJsonString() {
    return CartMapper.ensureInitialized().encodeJson<Cart>(this as Cart);
  }

  Map<String, dynamic> toJson() {
    return CartMapper.ensureInitialized().encodeMap<Cart>(this as Cart);
  }

  CartCopyWith<Cart, Cart, Cart> get copyWith =>
      _CartCopyWithImpl(this as Cart, $identity, $identity);
  @override
  String toString() {
    return CartMapper.ensureInitialized().stringifyValue(this as Cart);
  }

  @override
  bool operator ==(Object other) {
    return CartMapper.ensureInitialized().equalsValue(this as Cart, other);
  }

  @override
  int get hashCode {
    return CartMapper.ensureInitialized().hashValue(this as Cart);
  }
}

extension CartValueCopy<$R, $Out> on ObjectCopyWith<$R, Cart, $Out> {
  CartCopyWith<$R, Cart, $Out> get $asCart =>
      $base.as((v, t, t2) => _CartCopyWithImpl(v, t, t2));
}

abstract class CartCopyWith<$R, $In extends Cart, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CartItem, CartItemCopyWith<$R, CartItem, CartItem>>
      get cartItems;
  $R call({Uuid? id, List<CartItem>? cartItems});
  CartCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CartCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Cart, $Out>
    implements CartCopyWith<$R, Cart, $Out> {
  _CartCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cart> $mapper = CartMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CartItem, CartItemCopyWith<$R, CartItem, CartItem>>
      get cartItems => ListCopyWith($value.cartItems,
          (v, t) => v.copyWith.$chain(t), (v) => call(cartItems: v));
  @override
  $R call({Uuid? id, List<CartItem>? cartItems}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (cartItems != null) #cartItems: cartItems}));
  @override
  Cart $make(CopyWithData data) => Cart(
      id: data.get(#id, or: $value.id),
      cartItems: data.get(#cartItems, or: $value.cartItems));

  @override
  CartCopyWith<$R2, Cart, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CartCopyWithImpl($value, $cast, t);
}
