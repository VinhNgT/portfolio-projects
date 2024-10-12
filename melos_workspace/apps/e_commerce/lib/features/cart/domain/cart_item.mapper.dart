// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart_item.dart';

class CartItemMapper extends ClassMapperBase<CartItem> {
  CartItemMapper._();

  static CartItemMapper? _instance;
  static CartItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartItemMapper._());
      OrderItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CartItem';

  static OrderItem _$orderItem(CartItem v) => v.orderItem;
  static const Field<CartItem, OrderItem> _f$orderItem =
      Field('orderItem', _$orderItem);
  static bool _$isIncludeInOrder(CartItem v) => v.isIncludeInOrder;
  static const Field<CartItem, bool> _f$isIncludeInOrder =
      Field('isIncludeInOrder', _$isIncludeInOrder);

  @override
  final MappableFields<CartItem> fields = const {
    #orderItem: _f$orderItem,
    #isIncludeInOrder: _f$isIncludeInOrder,
  };

  static CartItem _instantiate(DecodingData data) {
    return CartItem(
        orderItem: data.dec(_f$orderItem),
        isIncludeInOrder: data.dec(_f$isIncludeInOrder));
  }

  @override
  final Function instantiate = _instantiate;

  static CartItem fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CartItem>(map);
  }

  static CartItem fromJsonString(String json) {
    return ensureInitialized().decodeJson<CartItem>(json);
  }
}

mixin CartItemMappable {
  String toJsonString() {
    return CartItemMapper.ensureInitialized()
        .encodeJson<CartItem>(this as CartItem);
  }

  Map<String, dynamic> toJson() {
    return CartItemMapper.ensureInitialized()
        .encodeMap<CartItem>(this as CartItem);
  }

  CartItemCopyWith<CartItem, CartItem, CartItem> get copyWith =>
      _CartItemCopyWithImpl(this as CartItem, $identity, $identity);
  @override
  String toString() {
    return CartItemMapper.ensureInitialized().stringifyValue(this as CartItem);
  }

  @override
  bool operator ==(Object other) {
    return CartItemMapper.ensureInitialized()
        .equalsValue(this as CartItem, other);
  }

  @override
  int get hashCode {
    return CartItemMapper.ensureInitialized().hashValue(this as CartItem);
  }
}

extension CartItemValueCopy<$R, $Out> on ObjectCopyWith<$R, CartItem, $Out> {
  CartItemCopyWith<$R, CartItem, $Out> get $asCartItem =>
      $base.as((v, t, t2) => _CartItemCopyWithImpl(v, t, t2));
}

abstract class CartItemCopyWith<$R, $In extends CartItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  OrderItemCopyWith<$R, OrderItem, OrderItem> get orderItem;
  $R call({OrderItem? orderItem, bool? isIncludeInOrder});
  CartItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CartItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CartItem, $Out>
    implements CartItemCopyWith<$R, CartItem, $Out> {
  _CartItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CartItem> $mapper =
      CartItemMapper.ensureInitialized();
  @override
  OrderItemCopyWith<$R, OrderItem, OrderItem> get orderItem =>
      $value.orderItem.copyWith.$chain((v) => call(orderItem: v));
  @override
  $R call({OrderItem? orderItem, bool? isIncludeInOrder}) =>
      $apply(FieldCopyWithData({
        if (orderItem != null) #orderItem: orderItem,
        if (isIncludeInOrder != null) #isIncludeInOrder: isIncludeInOrder
      }));
  @override
  CartItem $make(CopyWithData data) => CartItem(
      orderItem: data.get(#orderItem, or: $value.orderItem),
      isIncludeInOrder:
          data.get(#isIncludeInOrder, or: $value.isIncludeInOrder));

  @override
  CartItemCopyWith<$R2, CartItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartItemCopyWithImpl($value, $cast, t);
}
