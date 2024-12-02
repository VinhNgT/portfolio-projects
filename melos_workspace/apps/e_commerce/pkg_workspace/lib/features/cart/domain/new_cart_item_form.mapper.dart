// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'new_cart_item_form.dart';

class NewCartItemFormMapper extends ClassMapperBase<NewCartItemForm> {
  NewCartItemFormMapper._();

  static NewCartItemFormMapper? _instance;
  static NewCartItemFormMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewCartItemFormMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NewCartItemForm';

  static int _$quantity(NewCartItemForm v) => v.quantity;
  static const Field<NewCartItemForm, int> _f$quantity =
      Field('quantity', _$quantity);
  static Map<int, int?> _$variantSelection(NewCartItemForm v) =>
      v.variantSelection;
  static const Field<NewCartItemForm, Map<int, int?>> _f$variantSelection =
      Field('variantSelection', _$variantSelection);

  @override
  final MappableFields<NewCartItemForm> fields = const {
    #quantity: _f$quantity,
    #variantSelection: _f$variantSelection,
  };

  static NewCartItemForm _instantiate(DecodingData data) {
    return NewCartItemForm(
        quantity: data.dec(_f$quantity),
        variantSelection: data.dec(_f$variantSelection));
  }

  @override
  final Function instantiate = _instantiate;

  static NewCartItemForm fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NewCartItemForm>(map);
  }

  static NewCartItemForm fromJsonString(String json) {
    return ensureInitialized().decodeJson<NewCartItemForm>(json);
  }
}

mixin NewCartItemFormMappable {
  String toJsonString() {
    return NewCartItemFormMapper.ensureInitialized()
        .encodeJson<NewCartItemForm>(this as NewCartItemForm);
  }

  Map<String, dynamic> toJson() {
    return NewCartItemFormMapper.ensureInitialized()
        .encodeMap<NewCartItemForm>(this as NewCartItemForm);
  }

  NewCartItemFormCopyWith<NewCartItemForm, NewCartItemForm, NewCartItemForm>
      get copyWith => _NewCartItemFormCopyWithImpl(
          this as NewCartItemForm, $identity, $identity);
  @override
  String toString() {
    return NewCartItemFormMapper.ensureInitialized()
        .stringifyValue(this as NewCartItemForm);
  }

  @override
  bool operator ==(Object other) {
    return NewCartItemFormMapper.ensureInitialized()
        .equalsValue(this as NewCartItemForm, other);
  }

  @override
  int get hashCode {
    return NewCartItemFormMapper.ensureInitialized()
        .hashValue(this as NewCartItemForm);
  }
}

extension NewCartItemFormValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NewCartItemForm, $Out> {
  NewCartItemFormCopyWith<$R, NewCartItemForm, $Out> get $asNewCartItemForm =>
      $base.as((v, t, t2) => _NewCartItemFormCopyWithImpl(v, t, t2));
}

abstract class NewCartItemFormCopyWith<$R, $In extends NewCartItemForm, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, int, int?, ObjectCopyWith<$R, int?, int?>?>
      get variantSelection;
  $R call({int? quantity, Map<int, int?>? variantSelection});
  NewCartItemFormCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NewCartItemFormCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NewCartItemForm, $Out>
    implements NewCartItemFormCopyWith<$R, NewCartItemForm, $Out> {
  _NewCartItemFormCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewCartItemForm> $mapper =
      NewCartItemFormMapper.ensureInitialized();
  @override
  MapCopyWith<$R, int, int?, ObjectCopyWith<$R, int?, int?>?>
      get variantSelection => MapCopyWith(
          $value.variantSelection,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(variantSelection: v));
  @override
  $R call({int? quantity, Map<int, int?>? variantSelection}) =>
      $apply(FieldCopyWithData({
        if (quantity != null) #quantity: quantity,
        if (variantSelection != null) #variantSelection: variantSelection
      }));
  @override
  NewCartItemForm $make(CopyWithData data) => NewCartItemForm(
      quantity: data.get(#quantity, or: $value.quantity),
      variantSelection:
          data.get(#variantSelection, or: $value.variantSelection));

  @override
  NewCartItemFormCopyWith<$R2, NewCartItemForm, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NewCartItemFormCopyWithImpl($value, $cast, t);
}
