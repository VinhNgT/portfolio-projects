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

  static int? _$id(Order v) => v.id;
  static const Field<Order, int> _f$id = Field('id', _$id, opt: true);
  static List<OrderItem> _$items(Order v) => v.items;
  static const Field<Order, List<OrderItem>> _f$items = Field('items', _$items);
  static String _$receiveAddress(Order v) => v.receiveAddress;
  static const Field<Order, String> _f$receiveAddress =
      Field('receiveAddress', _$receiveAddress);
  static OrderStatus _$status(Order v) => v.status;
  static const Field<Order, OrderStatus> _f$status = Field('status', _$status);

  @override
  final MappableFields<Order> fields = const {
    #id: _f$id,
    #items: _f$items,
    #receiveAddress: _f$receiveAddress,
    #status: _f$status,
  };

  static Order _instantiate(DecodingData data) {
    return Order(
        id: data.dec(_f$id),
        items: data.dec(_f$items),
        receiveAddress: data.dec(_f$receiveAddress),
        status: data.dec(_f$status));
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
  $R call(
      {int? id,
      List<OrderItem>? items,
      String? receiveAddress,
      OrderStatus? status});
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
  $R call(
          {Object? id = $none,
          List<OrderItem>? items,
          String? receiveAddress,
          OrderStatus? status}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (items != null) #items: items,
        if (receiveAddress != null) #receiveAddress: receiveAddress,
        if (status != null) #status: status
      }));
  @override
  Order $make(CopyWithData data) => Order(
      id: data.get(#id, or: $value.id),
      items: data.get(#items, or: $value.items),
      receiveAddress: data.get(#receiveAddress, or: $value.receiveAddress),
      status: data.get(#status, or: $value.status));

  @override
  OrderCopyWith<$R2, Order, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OrderCopyWithImpl($value, $cast, t);
}
