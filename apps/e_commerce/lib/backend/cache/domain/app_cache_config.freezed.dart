// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cache_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppCacheConfig _$AppCacheConfigFromJson(Map<String, dynamic> json) {
  return _AppCacheConfig.fromJson(json);
}

/// @nodoc
mixin _$AppCacheConfig {
  Duration get cacheDuration => throw _privateConstructorUsedError;
  Duration get storageDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppCacheConfigCopyWith<AppCacheConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCacheConfigCopyWith<$Res> {
  factory $AppCacheConfigCopyWith(
          AppCacheConfig value, $Res Function(AppCacheConfig) then) =
      _$AppCacheConfigCopyWithImpl<$Res, AppCacheConfig>;
  @useResult
  $Res call({Duration cacheDuration, Duration storageDuration});
}

/// @nodoc
class _$AppCacheConfigCopyWithImpl<$Res, $Val extends AppCacheConfig>
    implements $AppCacheConfigCopyWith<$Res> {
  _$AppCacheConfigCopyWithImpl(this._value, this._then);

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
abstract class _$$AppCacheConfigImplCopyWith<$Res>
    implements $AppCacheConfigCopyWith<$Res> {
  factory _$$AppCacheConfigImplCopyWith(_$AppCacheConfigImpl value,
          $Res Function(_$AppCacheConfigImpl) then) =
      __$$AppCacheConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration cacheDuration, Duration storageDuration});
}

/// @nodoc
class __$$AppCacheConfigImplCopyWithImpl<$Res>
    extends _$AppCacheConfigCopyWithImpl<$Res, _$AppCacheConfigImpl>
    implements _$$AppCacheConfigImplCopyWith<$Res> {
  __$$AppCacheConfigImplCopyWithImpl(
      _$AppCacheConfigImpl _value, $Res Function(_$AppCacheConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cacheDuration = null,
    Object? storageDuration = null,
  }) {
    return _then(_$AppCacheConfigImpl(
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
class _$AppCacheConfigImpl implements _AppCacheConfig {
  const _$AppCacheConfigImpl(
      {this.cacheDuration = kDefaultCacheDuration,
      this.storageDuration = kDefaultCacheStorageDuration});

  factory _$AppCacheConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppCacheConfigImplFromJson(json);

  @override
  @JsonKey()
  final Duration cacheDuration;
  @override
  @JsonKey()
  final Duration storageDuration;

  @override
  String toString() {
    return 'AppCacheConfig(cacheDuration: $cacheDuration, storageDuration: $storageDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppCacheConfigImpl &&
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
  _$$AppCacheConfigImplCopyWith<_$AppCacheConfigImpl> get copyWith =>
      __$$AppCacheConfigImplCopyWithImpl<_$AppCacheConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppCacheConfigImplToJson(
      this,
    );
  }
}

abstract class _AppCacheConfig implements AppCacheConfig {
  const factory _AppCacheConfig(
      {final Duration cacheDuration,
      final Duration storageDuration}) = _$AppCacheConfigImpl;

  factory _AppCacheConfig.fromJson(Map<String, dynamic> json) =
      _$AppCacheConfigImpl.fromJson;

  @override
  Duration get cacheDuration;
  @override
  Duration get storageDuration;
  @override
  @JsonKey(ignore: true)
  _$$AppCacheConfigImplCopyWith<_$AppCacheConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
