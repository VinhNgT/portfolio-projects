// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_item.dart';

class OrderItemMapper extends ClassMapperBase<OrderItem> {
  OrderItemMapper._();

  static OrderItemMapper? _instance;
  static OrderItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderItemMapper._());
      ProductMapper.ensureInitialized();
      ProductVariantMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderItem';

  static Uuid _$id(OrderItem v) => v.id;
  static const Field<OrderItem, Uuid> _f$id = Field('id', _$id);
  static Product _$product(OrderItem v) => v.product;
  static const Field<OrderItem, Product> _f$product =
      Field('product', _$product);
  static int _$quantity(OrderItem v) => v.quantity;
  static const Field<OrderItem, int> _f$quantity =
      Field('quantity', _$quantity);
  static Map<Uuid, ProductVariant?> _$variantSelection(OrderItem v) =>
      v.variantSelection;
  static const Field<OrderItem, Map<Uuid, ProductVariant?>>
      _f$variantSelection = Field('variantSelection', _$variantSelection);

  @override
  final MappableFields<OrderItem> fields = const {
    #id: _f$id,
    #product: _f$product,
    #quantity: _f$quantity,
    #variantSelection: _f$variantSelection,
  };

  static OrderItem _instantiate(DecodingData data) {
    return OrderItem(
        id: data.dec(_f$id),
        product: data.dec(_f$product),
        quantity: data.dec(_f$quantity),
        variantSelection: data.dec(_f$variantSelection));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderItem fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderItem>(map);
  }

  static OrderItem fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderItem>(json);
  }
}

mixin OrderItemMappable {
  String toJsonString() {
    return OrderItemMapper.ensureInitialized()
        .encodeJson<OrderItem>(this as OrderItem);
  }

  Map<String, dynamic> toJson() {
    return OrderItemMapper.ensureInitialized()
        .encodeMap<OrderItem>(this as OrderItem);
  }

  OrderItemCopyWith<OrderItem, OrderItem, OrderItem> get copyWith =>
      _OrderItemCopyWithImpl(this as OrderItem, $identity, $identity);
  @override
  String toString() {
    return OrderItemMapper.ensureInitialized()
        .stringifyValue(this as OrderItem);
  }

  @override
  bool operator ==(Object other) {
    return OrderItemMapper.ensureInitialized()
        .equalsValue(this as OrderItem, other);
  }

  @override
  int get hashCode {
    return OrderItemMapper.ensureInitialized().hashValue(this as OrderItem);
  }
}

extension OrderItemValueCopy<$R, $Out> on ObjectCopyWith<$R, OrderItem, $Out> {
  OrderItemCopyWith<$R, OrderItem, $Out> get $asOrderItem =>
      $base.as((v, t, t2) => _OrderItemCopyWithImpl(v, t, t2));
}

abstract class OrderItemCopyWith<$R, $In extends OrderItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ProductCopyWith<$R, Product, Product> get product;
  MapCopyWith<$R, Uuid, ProductVariant?,
          ProductVariantCopyWith<$R, ProductVariant, ProductVariant>?>
      get variantSelection;
  $R call(
      {Uuid? id,
      Product? product,
      int? quantity,
      Map<Uuid, ProductVariant?>? variantSelection});
  OrderItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderItem, $Out>
    implements OrderItemCopyWith<$R, OrderItem, $Out> {
  _OrderItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderItem> $mapper =
      OrderItemMapper.ensureInitialized();
  @override
  ProductCopyWith<$R, Product, Product> get product =>
      $value.product.copyWith.$chain((v) => call(product: v));
  @override
  MapCopyWith<$R, Uuid, ProductVariant?,
          ProductVariantCopyWith<$R, ProductVariant, ProductVariant>?>
      get variantSelection => MapCopyWith($value.variantSelection,
          (v, t) => v?.copyWith.$chain(t), (v) => call(variantSelection: v));
  @override
  $R call(
          {Uuid? id,
          Product? product,
          int? quantity,
          Map<Uuid, ProductVariant?>? variantSelection}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (product != null) #product: product,
        if (quantity != null) #quantity: quantity,
        if (variantSelection != null) #variantSelection: variantSelection
      }));
  @override
  OrderItem $make(CopyWithData data) => OrderItem(
      id: data.get(#id, or: $value.id),
      product: data.get(#product, or: $value.product),
      quantity: data.get(#quantity, or: $value.quantity),
      variantSelection:
          data.get(#variantSelection, or: $value.variantSelection));

  @override
  OrderItemCopyWith<$R2, OrderItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderItemCopyWithImpl($value, $cast, t);
}
