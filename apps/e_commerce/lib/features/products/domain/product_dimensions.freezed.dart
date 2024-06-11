// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dimensions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDimensions _$ProductDimensionsFromJson(Map<String, dynamic> json) {
  return _ProductDimensions.fromJson(json);
}

/// @nodoc
mixin _$ProductDimensions {
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get depth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDimensionsCopyWith<ProductDimensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDimensionsCopyWith<$Res> {
  factory $ProductDimensionsCopyWith(
          ProductDimensions value, $Res Function(ProductDimensions) then) =
      _$ProductDimensionsCopyWithImpl<$Res, ProductDimensions>;
  @useResult
  $Res call({double? width, double? height, double? depth});
}

/// @nodoc
class _$ProductDimensionsCopyWithImpl<$Res, $Val extends ProductDimensions>
    implements $ProductDimensionsCopyWith<$Res> {
  _$ProductDimensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? depth = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDimensionsImplCopyWith<$Res>
    implements $ProductDimensionsCopyWith<$Res> {
  factory _$$ProductDimensionsImplCopyWith(_$ProductDimensionsImpl value,
          $Res Function(_$ProductDimensionsImpl) then) =
      __$$ProductDimensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? width, double? height, double? depth});
}

/// @nodoc
class __$$ProductDimensionsImplCopyWithImpl<$Res>
    extends _$ProductDimensionsCopyWithImpl<$Res, _$ProductDimensionsImpl>
    implements _$$ProductDimensionsImplCopyWith<$Res> {
  __$$ProductDimensionsImplCopyWithImpl(_$ProductDimensionsImpl _value,
      $Res Function(_$ProductDimensionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? depth = freezed,
  }) {
    return _then(_$ProductDimensionsImpl(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDimensionsImpl implements _ProductDimensions {
  const _$ProductDimensionsImpl({this.width, this.height, this.depth});

  factory _$ProductDimensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDimensionsImplFromJson(json);

  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? depth;

  @override
  String toString() {
    return 'ProductDimensions(width: $width, height: $height, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDimensionsImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, depth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDimensionsImplCopyWith<_$ProductDimensionsImpl> get copyWith =>
      __$$ProductDimensionsImplCopyWithImpl<_$ProductDimensionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDimensionsImplToJson(
      this,
    );
  }
}

abstract class _ProductDimensions implements ProductDimensions {
  const factory _ProductDimensions(
      {final double? width,
      final double? height,
      final double? depth}) = _$ProductDimensionsImpl;

  factory _ProductDimensions.fromJson(Map<String, dynamic> json) =
      _$ProductDimensionsImpl.fromJson;

  @override
  double? get width;
  @override
  double? get height;
  @override
  double? get depth;
  @override
  @JsonKey(ignore: true)
  _$$ProductDimensionsImplCopyWith<_$ProductDimensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
