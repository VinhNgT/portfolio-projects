// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CacheConfig _$CacheConfigFromJson(Map<String, dynamic> json) {
  return _CacheConfig.fromJson(json);
}

/// @nodoc
mixin _$CacheConfig {
  Duration get cacheDuration => throw _privateConstructorUsedError;
  Duration get storageDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CacheConfigCopyWith<CacheConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheConfigCopyWith<$Res> {
  factory $CacheConfigCopyWith(
          CacheConfig value, $Res Function(CacheConfig) then) =
      _$CacheConfigCopyWithImpl<$Res, CacheConfig>;
  @useResult
  $Res call({Duration cacheDuration, Duration storageDuration});
}

/// @nodoc
class _$CacheConfigCopyWithImpl<$Res, $Val extends CacheConfig>
    implements $CacheConfigCopyWith<$Res> {
  _$CacheConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cacheDuration = null,
    Object? storageDuration = null,
  }) {
    return _then(_value.copyWith(
      cacheDuration: null == cacheDuration
          ? _value.cacheDuration
          : cacheDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      storageDuration: null == storageDuration
          ? _value.storageDuration
          : storageDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CacheConfigImplCopyWith<$Res>
    implements $CacheConfigCopyWith<$Res> {
  factory _$$CacheConfigImplCopyWith(
          _$CacheConfigImpl value, $Res Function(_$CacheConfigImpl) then) =
      __$$CacheConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration cacheDuration, Duration storageDuration});
}

/// @nodoc
class __$$CacheConfigImplCopyWithImpl<$Res>
    extends _$CacheConfigCopyWithImpl<$Res, _$CacheConfigImpl>
    implements _$$CacheConfigImplCopyWith<$Res> {
  __$$CacheConfigImplCopyWithImpl(
      _$CacheConfigImpl _value, $Res Function(_$CacheConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cacheDuration = null,
    Object? storageDuration = null,
  }) {
    return _then(_$CacheConfigImpl(
      cacheDuration: null == cacheDuration
          ? _value.cacheDuration
          : cacheDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      storageDuration: null == storageDuration
          ? _value.storageDuration
          : storageDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CacheConfigImpl implements _CacheConfig {
  const _$CacheConfigImpl(
      {this.cacheDuration = kDefaultCacheDuration,
      this.storageDuration = kDefaultCacheStorageDuration});

  factory _$CacheConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$CacheConfigImplFromJson(json);

  @override
  @JsonKey()
  final Duration cacheDuration;
  @override
  @JsonKey()
  final Duration storageDuration;

  @override
  String toString() {
    return 'CacheConfig(cacheDuration: $cacheDuration, storageDuration: $storageDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheConfigImpl &&
            (identical(other.cacheDuration, cacheDuration) ||
                other.cacheDuration == cacheDuration) &&
            (identical(other.storageDuration, storageDuration) ||
                other.storageDuration == storageDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cacheDuration, storageDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheConfigImplCopyWith<_$CacheConfigImpl> get copyWith =>
      __$$CacheConfigImplCopyWithImpl<_$CacheConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CacheConfigImplToJson(
      this,
    );
  }
}

abstract class _CacheConfig implements CacheConfig {
  const factory _CacheConfig(
      {final Duration cacheDuration,
      final Duration storageDuration}) = _$CacheConfigImpl;

  factory _CacheConfig.fromJson(Map<String, dynamic> json) =
      _$CacheConfigImpl.fromJson;

  @override
  Duration get cacheDuration;
  @override
  Duration get storageDuration;
  @override
  @JsonKey(ignore: true)
  _$$CacheConfigImplCopyWith<_$CacheConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
