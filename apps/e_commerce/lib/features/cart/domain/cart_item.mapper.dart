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
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CartItem';

  static Product _$product(CartItem v) => v.product;
  static const Field<CartItem, Product> _f$product =
      Field('product', _$product);
  static int _$quantity(CartItem v) => v.quantity;
  static const Field<CartItem, int> _f$quantity = Field('quantity', _$quantity);
  static Set<ProductVariant> _$selectedVariants(CartItem v) =>
      v.selectedVariants;
  static const Field<CartItem, Set<ProductVariant>> _f$selectedVariants =
      Field('selectedVariants', _$selectedVariants, opt: true, def: const {});

  @override
  final MappableFields<CartItem> fields = const {
    #product: _f$product,
    #quantity: _f$quantity,
    #selectedVariants: _f$selectedVariants,
  };

  static CartItem _instantiate(DecodingData data) {
    return CartItem(
        product: data.dec(_f$product),
        quantity: data.dec(_f$quantity),
        selectedVariants: data.dec(_f$selectedVariants));
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
  ProductCopyWith<$R, Product, Product> get product;
  $R call(
      {Product? product, int? quantity, Set<ProductVariant>? selectedVariants});
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
  ProductCopyWith<$R, Product, Product> get product =>
      $value.product.copyWith.$chain((v) => call(product: v));
  @override
  $R call(
          {Product? product,
          int? quantity,
          Set<ProductVariant>? selectedVariants}) =>
      $apply(FieldCopyWithData({
        if (product != null) #product: product,
        if (quantity != null) #quantity: quantity,
        if (selectedVariants != null) #selectedVariants: selectedVariants
      }));
  @override
  CartItem $make(CopyWithData data) => CartItem(
      product: data.get(#product, or: $value.product),
      quantity: data.get(#quantity, or: $value.quantity),
      selectedVariants:
          data.get(#selectedVariants, or: $value.selectedVariants));

  @override
  CartItemCopyWith<$R2, CartItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartItemCopyWithImpl($value, $cast, t);
}