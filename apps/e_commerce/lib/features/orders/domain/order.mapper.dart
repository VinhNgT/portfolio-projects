// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order.dart';

class OrderMapper extends ClassMapperBase<Order> {
  OrderMapper._();

  static OrderMapper? _instance;
  static OrderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderMapper._());
      OrderItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Order';

  static List<OrderItem> _$items(Order v) => v.items;
  static const Field<Order, List<OrderItem>> _f$items = Field('items', _$items);
  static double _$orderDiscount(Order v) => v.orderDiscount;
  static const Field<Order, double> _f$orderDiscount =
      Field('orderDiscount', _$orderDiscount, opt: true, def: 0);

  @override
  final MappableFields<Order> fields = const {
    #items: _f$items,
    #orderDiscount: _f$orderDiscount,
  };

  static Order _instantiate(DecodingData data) {
    return Order(
        items: data.dec(_f$items), orderDiscount: data.dec(_f$orderDiscount));
  }

  @override
  final Function instantiate = _instantiate;

  static Order fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Order>(map);
  }

  static Order fromJsonString(String json) {
    return ensureInitialized().decodeJson<Order>(json);
  }
}

mixin OrderMappable {
  String toJsonString() {
    return OrderMapper.ensureInitialized().encodeJson<Order>(this as Order);
  }

  Map<String, dynamic> toJson() {
    return OrderMapper.ensureInitialized().encodeMap<Order>(this as Order);
  }

  OrderCopyWith<Order, Order, Order> get copyWith =>
      _OrderCopyWithImpl(this as Order, $identity, $identity);
  @override
  String toString() {
    return OrderMapper.ensureInitialized().stringifyValue(this as Order);
  }

  @override
  bool operator ==(Object other) {
    return OrderMapper.ensureInitialized().equalsValue(this as Order, other);
  }

  @override
  int get hashCode {
    return OrderMapper.ensureInitialized().hashValue(this as Order);
  }
}

extension OrderValueCopy<$R, $Out> on ObjectCopyWith<$R, Order, $Out> {
  OrderCopyWith<$R, Order, $Out> get $asOrder =>
      $base.as((v, t, t2) => _OrderCopyWithImpl(v, t, t2));
}

abstract class OrderCopyWith<$R, $In extends Order, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, OrderItem, OrderItemCopyWith<$R, OrderItem, OrderItem>>
      get items;
  $R call({List<OrderItem>? items, double? orderDiscount});
  OrderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Order, $Out>
    implements OrderCopyWith<$R, Order, $Out> {
  _OrderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Order> $mapper = OrderMapper.ensureInitialized();
  @override
  ListCopyWith<$R, OrderItem, OrderItemCopyWith<$R, OrderItem, OrderItem>>
      get items => ListCopyWith(
          $value.items, (v, t) => v.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({List<OrderItem>? items, double? orderDiscount}) =>
      $apply(FieldCopyWithData({
        if (items != null) #items: items,
        if (orderDiscount != null) #orderDiscount: orderDiscount
      }));
  @override
  Order $make(CopyWithData data) => Order(
      items: data.get(#items, or: $value.items),
      orderDiscount: data.get(#orderDiscount, or: $value.orderDiscount));

  @override
  OrderCopyWith<$R2, Order, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OrderCopyWithImpl($value, $cast, t);
}
